#!/bin/bash
# Load environment variables from .env file in plugin directory
if [ -f "${CLAUDE_PLUGIN_ROOT}/.env" ]; then
    export $(grep -v '^#' "${CLAUDE_PLUGIN_ROOT}/.env" | xargs)
fi

# Start Notion MCP server
exec npx -y @modelcontextprotocol/server-notion