#!/bin/bash
# Load environment variables from .env file in plugin directory
if [ -f "${CLAUDE_PLUGIN_ROOT}/.env" ]; then
    export $(grep -v '^#' "${CLAUDE_PLUGIN_ROOT}/.env" | xargs)
fi

# Start PostHog MCP server
exec npx -y @modelcontextprotocol/server-posthog