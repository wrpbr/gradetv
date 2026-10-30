---
name: gradetv
description: Find public TV and radio channels with GradeTV, check whether their streams play, read TV guides and keep channels in personal folders with M3U feeds.
license: MIT-0
---

# GradeTV

Connect to `https://gradetv.net/mcp` with Streamable HTTP for free and paid API services.
Directory clients use `https://gradetv.net/mcp?checkout=site`: purchase tools and x402 are disabled there.
Read `https://gradetv.net/llms.txt` for the current API contract.

## Free and paid services

Channel search, a day's stored schedule and the personal library are free.
The per-call schedule tools return up to seven days and are paid from the first call:
`get_api_x402_programacao_by_slug` and `get_api_x402_programacao_by_slug_by_dia`.
Chat and TV passes have separate prices and terms. Read `tools/list`,
`https://gradetv.net/api/pricing` and `https://gradetv.net/api/billing` before use.
Payment does not grant audiovisual rights.

Direct MCP returns x402 PaymentRequired in `structuredContent` with `isError: true`.
Require explicit spending authority and a budget before retrying with `params._meta["x402/payment"]`.
For HTTP, use `PAYMENT-SIGNATURE`; prepaid credit uses `X-Credito: cred_…`.
For site purchases, open `https://gradetv.net/pricing`; use Pix or card only when offered.
Never send card details through MCP. In ChatGPT, use existing rights without offers or purchases in the app.

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
