# Setup MCP Servers

Help users configure API keys for the Superpower Growth Agents plugin MCP servers.

## Instructions:

1. **Show the template**:
   Display the contents of `.env.example` from the plugin directory

2. **Explain where to add keys**:
   Tell the user they have three options:
   - Add to ~/.zshrc or ~/.bashrc (permanent)
   - Create ~/.claude/.env file
   - Set before launching Claude

3. **Show example with their keys**:
   If the user provides API keys, show them exactly what to add to their shell profile:
   ```bash
   export NOTION_API_KEY="their-actual-key"
   export POSTHOG_API_KEY="their-actual-key"
   export POSTHOG_PROJECT_ID="their-actual-id"
   ```

4. **Offer to create .env file**:
   If they prefer, create a .env file in their home directory with their actual keys

5. **Remind to restart**:
   Tell them to restart Claude Code after setting environment variables

## Template to show:
```
# Required API Keys for Superpower Growth Agents Plugin

NOTION_API_KEY=your-notion-api-key-here
# Get from: https://www.notion.so/my-integrations

POSTHOG_API_KEY=your-posthog-api-key-here
POSTHOG_PROJECT_ID=your-posthog-project-id-here
# Get from: Your PostHog project settings
```

Keep it simple and help them get the MCP servers running quickly!