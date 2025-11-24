# Superpower Growth Agents Plugin

AI agents for health-tech growth marketing with Meta ad copywriting and compliance review.

## Installation & Setup

### 1. Install the Plugin
Install this plugin through Claude's plugin marketplace.

### 2. Configure API Keys

⚠️ **Important**: As a Claude Code plugin, you must set environment variables **before** launching Claude. The MCP servers won't work without these keys.

#### Quick Setup via Claude
After installing the plugin, you can:
- Type `/setup` for guided API key configuration
- Ask "Show me the .env.example from Superpower plugin"
- Ask "Create a .env file with my API keys"

#### Option A: System Environment Variables (Recommended)
Add these to your shell profile (`~/.zshrc` or `~/.bashrc`):

```bash
# Add to your ~/.bashrc, ~/.zshrc, or system environment
export NOTION_API_KEY="your-notion-api-key"
export POSTHOG_API_KEY="your-posthog-api-key"
export POSTHOG_PROJECT_ID="your-posthog-project-id"
```

Then restart Claude Code for the changes to take effect.

#### Option B: Local Configuration File
Create a `.env` file in your home directory or Claude configuration directory:

```bash
# ~/.claude/.env or ~/Documents/Claude/.env
NOTION_API_KEY=your-notion-api-key
POSTHOG_API_KEY=your-posthog-api-key
POSTHOG_PROJECT_ID=your-posthog-project-id
```

### 3. Getting Your API Keys

- **Notion API Key**:
  1. Go to https://www.notion.so/my-integrations
  2. Create a new integration
  3. Copy the Internal Integration Token

- **PostHog API Key & Project ID**:
  1. Go to your PostHog project settings
  2. Find your Project API Key under Project Settings
  3. Your Project ID is in the URL or project settings

## Features

### AI Agents

1. **Meta Ad Copywriter** (`/meta-ad-copywriter`)
   - Writes Meta ads using Eugene Schwartz frameworks
   - Channels 17 fundamental human desires
   - Built-in Meta compliance

2. **Clinical Claims Analyst** (`/clinical-claims-analyst`)
   - Reviews health claims for FDA/FTC compliance
   - Provides aggressive-but-defensible rewrites
   - 5-minute rapid analysis

3. **Static Ad Brief Writer** (`/static-ad-brief-writer`)
   - Creates comprehensive creative briefs
   - Performs Reddit audience research
   - Maps to Steven Reiss 16 desires

### Commands

- `/setup` - Interactive API key configuration helper
- `/pr` - Quick PR review and GitHub push workflow

### MCP Server Integrations

- **Notion**: Manage marketing content and documentation
- **PostHog**: Track campaign performance and analytics

## Usage

Once configured, the plugin's agents and commands will be available in Claude. The MCP servers start automatically and their tools will be prefixed with `mcp__` in Claude's toolkit.

Example:
```
User: "Write a Meta ad for our diabetes testing campaign"
Assistant: I'll use the meta-ad-copywriter agent to create compliant, high-converting ad copy...
```

## For Developers

If you're contributing to this plugin or testing locally, you can use the dev setup script:
```bash
./dev-setup.sh
```
This is **only for development**, not for end users installing via Claude marketplace.

## Support

For issues or questions, please open an issue on our GitHub repository.