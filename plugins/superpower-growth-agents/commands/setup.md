# Setup MCP Servers

Help users configure API keys for the Superpower Growth Agents plugin MCP servers.

## Instructions:

1. **Ask for their API keys**:
   Ask the user to provide:
   - Notion API key (from https://www.notion.so/my-integrations)
   - PostHog API key (from their PostHog project settings)
   - PostHog Project ID (from their PostHog project settings)

2. **Create the .env file**:
   When they provide the keys, create a `.env` file with their actual values.
   The file should go in the plugin directory (find it first).

3. **Show what you're creating**:
   ```
   NOTION_API_KEY=their-actual-key-here
   POSTHOG_API_KEY=their-actual-key-here
   POSTHOG_PROJECT_ID=their-actual-id-here
   ```

4. **Find plugin location**:
   Look for the plugin in common locations:
   - Try to find where Superpower Growth Agents plugin is installed
   - Create the .env file in that directory

5. **Remind to restart**:
   Tell them to restart Claude Code after creating the .env file

## Template to show:
```
# Required API Keys for Superpower Growth Agents Plugin

NOTION_API_KEY=your-notion-api-key-here
# Get from: https://www.notion.so/my-integrations

POSTHOG_API_KEY=your-posthog-api-key-here
POSTHOG_PROJECT_ID=your-posthog-project-id-here
# Get from: Your PostHog project settings
```

**IMPORTANT**: Don't try to read .env.example or other plugin files - they're not accessible when the plugin is installed. Use the template shown above instead.

Keep it simple and help them get the MCP servers running quickly!