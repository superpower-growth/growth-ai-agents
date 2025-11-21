# MCP Server Setup Guide

This plugin includes Notion and PostHog MCP servers that require API keys to function.

## Required Environment Variables

Before installing or using this plugin, you must set the following environment variables:

```bash
export NOTION_API_KEY="your-notion-api-key"
export POSTHOG_API_KEY="your-posthog-api-key"
export POSTHOG_PROJECT_ID="your-posthog-project-id"
```

## Getting Your API Keys

### Notion API Key

1. Go to [https://www.notion.so/my-integrations](https://www.notion.so/my-integrations)
2. Click "New integration"
3. Give it a name (e.g., "Superpower Growth Agents")
4. Select the workspace you want to connect
5. Copy the "Internal Integration Token" - this is your `NOTION_API_KEY`
6. **Important**: Share the Notion pages/databases you want to access with this integration

### PostHog API Key

1. Go to your PostHog instance settings
2. Navigate to "Project" → "Project API Key"
3. Copy your **Personal API Key** (not the Project API Key)
4. Copy your **Project ID** from the URL or project settings

## Setting Environment Variables

### macOS/Linux (Bash/Zsh)

Add to your `~/.zshrc` or `~/.bashrc`:

```bash
export NOTION_API_KEY="secret_xxxxxxxxxxxxx"
export POSTHOG_API_KEY="phx_xxxxxxxxxxxxx"
export POSTHOG_PROJECT_ID="12345"
```

Then reload your shell:
```bash
source ~/.zshrc  # or source ~/.bashrc
```

### Windows (PowerShell)

```powershell
$env:NOTION_API_KEY="secret_xxxxxxxxxxxxx"
$env:POSTHOG_API_KEY="phx_xxxxxxxxxxxxx"
$env:POSTHOG_PROJECT_ID="12345"
```

To persist across sessions, use System Environment Variables in Windows Settings.

## Verifying Setup

After setting environment variables, restart Claude Code and verify the MCP servers are loaded:

1. Restart Claude Code completely
2. The plugin should load both Notion and PostHog MCP servers
3. All agents in this plugin will have access to these servers

## Troubleshooting

**Error: "NOTION_API_KEY is not set"**
- Ensure you exported the environment variable in your shell
- Restart Claude Code after setting environment variables
- Verify the variable is set: `echo $NOTION_API_KEY`

**Error: "Connection failed to Notion"**
- Verify your API key is correct
- Ensure you've shared Notion pages with the integration
- Check that the integration has the necessary permissions

**Error: "PostHog authentication failed"**
- Use your **Personal API Key**, not the Project API Key
- Verify the Project ID is correct (should be a number)
- Check that your PostHog instance is accessible

## What Each MCP Server Provides

### Notion MCP
- Search Notion workspace
- Fetch page/database content
- Create and update pages
- Query databases

### PostHog MCP
- Query analytics data
- Access feature flags
- View insights and dashboards
- Run HogQL queries

Both servers are available to all agents in this plugin automatically.
