#!/bin/bash

# PR Review and Git Push Script
# This script helps review PRs and push changes to GitHub

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[PR-REVIEW]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

# Check if we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    print_error "Not in a git repository!"
    exit 1
fi

# Parse command line arguments
ACTION=${1:-review}
PR_NUMBER=$2
COMMIT_MESSAGE=""

case "$ACTION" in
    review)
        print_status "Starting PR review..."

        # Get current branch
        CURRENT_BRANCH=$(git branch --show-current)
        print_status "Current branch: $CURRENT_BRANCH"

        # Get list of changed files
        print_status "Files changed in this branch:"
        git diff --name-status main..HEAD

        # Get diff for review
        print_status "Generating diff for review..."
        git diff main..HEAD > /tmp/pr-diff.txt

        echo ""
        print_status "Review process initiated. Use the pr-comment-writer agent to analyze these changes."
        echo ""
        echo "To invoke the agent, use:"
        echo "  @agent-superpower-growth-agents:pr-comment-writer"
        echo ""
        echo "The diff has been saved to /tmp/pr-diff.txt"
        ;;

    commit)
        shift  # Remove 'commit' from args
        COMMIT_MESSAGE="$@"

        if [ -z "$COMMIT_MESSAGE" ]; then
            print_error "Please provide a commit message!"
            echo "Usage: $0 commit 'Your commit message here'"
            exit 1
        fi

        print_status "Staging all changes..."
        git add -A

        print_status "Creating commit..."
        git commit -m "$COMMIT_MESSAGE

Reviewed and updated via PR comment writer agent

Co-Authored-By: Claude <noreply@anthropic.com>"

        print_status "Commit created successfully!"
        ;;

    push)
        print_status "Pushing to remote..."

        CURRENT_BRANCH=$(git branch --show-current)

        # Check if branch exists on remote
        if git ls-remote --heads origin "$CURRENT_BRANCH" | grep -q "$CURRENT_BRANCH"; then
            print_status "Pushing to existing remote branch: $CURRENT_BRANCH"
            git push
        else
            print_status "Creating new remote branch: $CURRENT_BRANCH"
            git push -u origin "$CURRENT_BRANCH"
        fi

        print_status "Push complete!"

        # Generate PR URL for GitHub
        REPO_URL=$(git config --get remote.origin.url)
        if [[ $REPO_URL == *"github.com"* ]]; then
            # Convert SSH URL to HTTPS if needed
            REPO_URL=${REPO_URL/git@github.com:/https://github.com/}
            REPO_URL=${REPO_URL%.git}

            PR_URL="$REPO_URL/compare/main...$CURRENT_BRANCH?expand=1"
            echo ""
            print_status "Create PR at: $PR_URL"
        fi
        ;;

    fix)
        print_status "Creating fixes branch..."

        # Create a new branch for fixes
        FIXES_BRANCH="pr-review-fixes-$(date +%Y%m%d-%H%M%S)"
        git checkout -b "$FIXES_BRANCH"

        print_status "Created branch: $FIXES_BRANCH"
        echo ""
        echo "You can now make fixes and then run:"
        echo "  $0 commit 'Your commit message'"
        echo "  $0 push"
        ;;

    status)
        print_status "Git Status:"
        git status
        echo ""
        print_status "Recent commits:"
        git log --oneline -5
        echo ""
        print_status "Current branch:"
        git branch --show-current
        ;;

    *)
        echo "Usage: $0 [action] [options]"
        echo ""
        echo "Actions:"
        echo "  review              - Review current changes against main branch"
        echo "  commit 'message'    - Create a commit with the given message"
        echo "  push               - Push current branch to remote"
        echo "  fix                - Create a new branch for PR fixes"
        echo "  status             - Show current git status"
        echo ""
        echo "Example workflow:"
        echo "  1. $0 review                    # Review changes"
        echo "  2. $0 fix                       # Create fixes branch"
        echo "  3. # Make your fixes"
        echo "  4. $0 commit 'Fix PR comments'  # Commit changes"
        echo "  5. $0 push                      # Push to GitHub"
        ;;
esac