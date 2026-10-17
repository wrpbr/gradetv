# Grade TV MCP server

Grade TV (GradeTV) helps an assistant find public TV channels and radio stations. Each channel shows its streams,
how often they play and why they fail, and the TV guide when one is available. A person can keep channels in
personal folders and play them in the browser or in VLC with a stable M3U feed. This repository contains the
connection settings and a user skill. The hosted service runs at [gradetv.net](https://gradetv.net).

## Configure

The server uses Streamable HTTP. No local program is required. Add this to `.vscode/mcp.json` for GitHub Copilot
in VS Code:

```json
{
  "servers": {
    "gradetv": {
      "type": "http",
      "url": "https://gradetv.net/mcp?checkout=site"
    }
  }
}
```

For Cursor, use the same entry under `mcpServers` in `.cursor/mcp.json`. For other clients, select an HTTP server
and enter the URL above. The official registry entry is `net.gradetv/grade`.

## Use

Ask: "Find Brazilian news channels that play now and show today's guide."

- `search_channels` searches channels and radio stations.
- `get_channel` reads one channel and its streams.
- `channel_health` reads the play rate and the failure reasons.
- `get_channel_guide` reads today's TV guide.
- `create_guest`, `get_library` and `add_item` keep channels in a personal library with feed URLs.

GradeTV lists streams that broadcasters and public lists publish. It does not grant rights to the content.

## Access and cost

Browsing the catalog, the guides and the personal library requires no account and costs nothing. Watching on a TV
set uses a paid TV pass. If a feature requires payment, complete the purchase on the website. The connection above disables payment transactions through
the assistant.

## Documentation and support

- [Setup and API documentation](https://gradetv.net/developers)
- [Live API contract](https://gradetv.net/openapi.json)
- [Agent reference](https://gradetv.net/llms.txt)

Send support requests to contato@gradetv.net or open an issue here. The files in this repository use the MIT-0
license. The hosted service has separate terms. Its source code is not included.
