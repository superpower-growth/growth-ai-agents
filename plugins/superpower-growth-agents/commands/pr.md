# PR Review & Push

Quick command to review changes, commit, and push to GitHub.

## Instructions:

1. **Show current git status**
   - Run `git status --short` to show changed files
   - Run `git diff --stat` to show change summary

2. **Review the changes**
   - Check for obvious bugs or security issues
   - Point out any major problems (but keep it brief)
   - If everything looks good, proceed to next step

3. **Check branch and create feature branch if needed**
   - Check current branch with `git branch --show-current`
   - If on main/master, create feature branch FIRST: `git checkout -b feat/description`
   - This ensures commits go to the feature branch, not main

4. **Create the commit**
   - Ask what type of change this is: feat/fix/docs/style/refactor/test/chore
   - Generate a conventional commit message
   - Run: `git add -A && git commit -m "message"`

5. **Push to GitHub**
   - Push with: `git push` (or `git push -u origin branch-name` for new branches)
   - Provide the GitHub PR creation URL

## Example:

```
📝 Changes detected:
- 3 files modified
- plugins/superpower-growth-agents/.claude-plugin/commands/pr.md (new)
- plugins/superpower-growth-agents/.claude-plugin/agents/clinical-claims-analyst.md (modified)

✅ No critical issues found.

What type of change? (feat/fix/docs/etc): feat
Commit message: Add PR review command for quick GitHub workflow

Pushing to: feat/add-pr-command
🔗 Create PR: https://github.com/superpowerdotcom/growth-ai-agents/pull/new/feat/add-pr-command
```

Keep it quick and focused - this is for rapid commits and pushes!