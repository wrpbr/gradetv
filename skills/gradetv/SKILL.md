---
name: gradetv
description: Find public TV and radio channels with GradeTV, check whether their streams play, read TV guides and keep channels in personal folders with M3U feeds.
license: MIT-0
---

# GradeTV

Connect to `https://gradetv.net/mcp?checkout=site` with Streamable HTTP.
Read `https://gradetv.net/llms.txt` for the current API contract.

## MCP tools

| Tool | Use |
|---|---|
| `search_channels` | Search public TV channels and radio stations by name, country, category, language or quality. |
| `get_channel` | Read one channel: its streams, country, languages and links. |
| `channel_health` | Read how often the channel plays and why it fails. |
| `get_channel_guide` | Read today's TV guide of a channel that has one. |
| `list_countries` | List the countries in the catalog with the playable count. |
| `list_programacao` | List the channels with a collected TV guide. |
| `get_programacao_dia` | Read the stored TV guide of a channel on one day. |
| `create_guest` | Create a guest token that owns a personal library. |
| `get_library` | Read the folders, tabs, channels and feed URLs of the library. |
| `add_item` | Add a channel to a tab of the library. |

## Use

Search before you recommend a channel, and cite the channel page. Check `channel_health` before you say that a
stream works. GradeTV lists streams that broadcasters and public lists publish; it does not grant rights to the
content. Keep the guest token: without it, the guest library is lost. If a feature needs payment, ask the person to
complete it on the website.
