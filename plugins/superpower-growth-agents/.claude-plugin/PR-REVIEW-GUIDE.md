# PR Review & GitHub Push Guide

This guide explains how to use the PR comment writer agent and associated scripts to review code changes, write meaningful PR comments, and push updates to GitHub.

## Quick Start

### 1. Review Current Changes
```bash
# Review changes in current branch against main
./plugins/superpower-growth-agents/.claude-plugin/scripts/pr-review.sh review
```

### 2. Invoke the PR Comment Writer Agent
```
@agent-superpower-growth-agents:pr-comment-writer
```

### 3. Create Fixes Branch (if needed)
```bash
./plugins/superpower-growth-agents/.claude-plugin/scripts/pr-review.sh fix
```

### 4. Commit Changes
```bash
./plugins/superpower-growth-agents/.claude-plugin/scripts/pr-review.sh commit "Fix: Address PR review comments"
```

### 5. Push to GitHub
```bash
./plugins/superpower-growth-agents/.claude-plugin/scripts/pr-review.sh push
```

## Detailed Workflow

### Option 1: Review an Existing PR

1. **Get PR changes for review:**
   ```bash
   # If you want to review specific PR changes
   git fetch origin pull/123/head:pr-123
   git checkout pr-123
   ./plugins/superpower-growth-agents/.claude-plugin/scripts/pr-review.sh review
   ```

2. **Invoke the agent to analyze:**
   ```
   @agent-superpower-growth-agents:pr-comment-writer

   Please review the changes in /tmp/pr-diff.txt and provide feedback
   ```

3. **The agent will provide:**
   - Security issue identification
   - Performance suggestions
   - Code quality improvements
   - Formatted PR comments ready to paste

### Option 2: Make Fixes and Push

1. **Create a fixes branch:**
   ```bash
   ./plugins/superpower-growth-agents/.claude-plugin/scripts/pr-review.sh fix
   ```

2. **Make the necessary changes** based on review comments

3. **Commit with descriptive message:**
   ```bash
   ./plugins/superpower-growth-agents/.claude-plugin/scripts/pr-review.sh commit "fix: Address security vulnerability and improve performance

   - Sanitize user inputs to prevent SQL injection
   - Optimize data processing from O(n²) to O(n)
   - Add comprehensive error handling
   - Update tests for new validation"
   ```

4. **Push to GitHub:**
   ```bash
   ./plugins/superpower-growth-agents/.claude-plugin/scripts/pr-review.sh push
   ```

5. **Create PR:** The script will output a GitHub URL to create your PR

## Using the PR Comment Writer Agent

The agent can be invoked for different scenarios:

### Basic Review
```
@agent-superpower-growth-agents:pr-comment-writer

Review the current branch changes and provide feedback
```

### Security-Focused Review
```
@agent-superpower-growth-agents:pr-comment-writer

Focus on security vulnerabilities in the current changes
```

### Performance Review
```
@agent-superpower-growth-agents:pr-comment-writer

Analyze the performance implications of these changes
```

### Fix Implementation
```
@agent-superpower-growth-agents:pr-comment-writer

Implement fixes for the critical issues you identified
```

## Script Commands Reference

| Command | Description | Example |
|---------|-------------|---------|
| `review` | Analyze changes vs main branch | `./pr-review.sh review` |
| `fix` | Create new fixes branch | `./pr-review.sh fix` |
| `commit` | Create commit with message | `./pr-review.sh commit "Your message"` |
| `push` | Push branch to remote | `./pr-review.sh push` |
| `status` | Show git status | `./pr-review.sh status` |

## Best Practices

1. **Always review before pushing:**
   - Run the review command first
   - Let the agent analyze for issues
   - Fix critical problems before pushing

2. **Clear commit messages:**
   - Use conventional commits (fix:, feat:, docs:, etc.)
   - Reference the PR number if applicable
   - List key changes made

3. **Incremental fixes:**
   - Address critical issues first
   - Create separate commits for different types of fixes
   - Push frequently to avoid losing work

4. **PR Comments:**
   - Copy the agent's formatted comments to GitHub
   - Tag relevant team members
   - Link to specific commits for fixes

## Example Complete Flow

```bash
# 1. Start review
./plugins/superpower-growth-agents/.claude-plugin/scripts/pr-review.sh review

# 2. In Claude Code, invoke agent
# @agent-superpower-growth-agents:pr-comment-writer
# Review and identify issues

# 3. Create fixes branch
./plugins/superpower-growth-agents/.claude-plugin/scripts/pr-review.sh fix

# 4. Make fixes (manually or with agent help)
# ... edit files ...

# 5. Commit fixes
./plugins/superpower-growth-agents/.claude-plugin/scripts/pr-review.sh commit "fix: Address PR review comments

- Fix SQL injection vulnerability
- Improve query performance
- Add input validation"

# 6. Push to GitHub
./plugins/superpower-growth-agents/.claude-plugin/scripts/pr-review.sh push

# 7. Create PR on GitHub using the provided URL
```

## Troubleshooting

### Permission Denied
```bash
chmod +x ./plugins/superpower-growth-agents/.claude-plugin/scripts/pr-review.sh
```

### Not in Git Repository
Make sure you're in the root of your git project:
```bash
cd /Users/davidquan/Documents/GitHub/growth-ai-agents
```

### Branch Already Exists
The script will handle existing branches, but you can manually switch:
```bash
git checkout existing-branch
```

### Push Rejected
If push is rejected, you may need to pull first:
```bash
git pull --rebase origin main
```

## Integration with CI/CD

You can integrate this into your CI/CD pipeline:

```yaml
# .github/workflows/pr-review.yml
name: AI PR Review

on:
  pull_request:
    types: [opened, synchronize]

jobs:
  review:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Run AI Review
        run: |
          ./plugins/superpower-growth-agents/.claude-plugin/scripts/pr-review.sh review
          # Additional steps to post comments via GitHub API
```

## Notes

- The agent follows best practices for constructive code reviews
- Focus is on meaningful improvements, not nitpicking
- Security issues are always prioritized
- All suggestions come with example fixes
- The script handles both new and existing branches
- Commits are co-authored with Claude for transparency