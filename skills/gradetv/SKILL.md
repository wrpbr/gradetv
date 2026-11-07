---
name: gradetv
description: Read collected TV schedules by channel and date without building a programme collector. Use free daily reads or a paid response with several available days.
license: MIT-0
---

# GradeTV

MCP tools: `list_programacao`, `get_programacao_dia`, `get_api_x402_programacao_by_slug`, `list_tags`, `list_languages`, `search_channels`, `channel_health`, `play_reports`, `list_favorites`.

Use the collected schedules instead of maintaining an EPG collection process.

## Everyday requests

Use this skill for TV schedules, channel discovery and observed playback problems.
Reuse the channel and day from context. Confirm timezone and resolve the returned channel slug.
Keep searches bounded. Do not invent missing programmes or bypass media restrictions.

- "What is on TV Brasil tonight?" Resolve the channel with `list_programacao` and read `get_programacao_dia`.
- "Build this channel's schedule for the next few days." Compare free daily reads with the quoted multi-day response.
- "Find Portuguese-language news channels for my list." Resolve tags and language, then use `search_channels`.
- "Is this channel having playback problems?" Read dated `channel_health` and `play_reports`.
- "Show today's schedules for my favorite channels." Read authorized `list_favorites` and the available daily schedules.

## First request

Use `list_programacao` to find channels with collected schedules.
Choose a returned channel slug and use `get_programacao_dia`
or `GET https://gradetv.net/api/programacao/{slug}/{dia}` for the required day.
Daily reads are free. Check available dates and source information.

For several days in one response, compare the per-call route with reading the daily responses.
The paid operation returns up to seven collected days. It cannot supply a missing date.
For a ready calendar, use `GET /api/x402/programacao/{slug}/{dia}?programa={title}&agenda=1`.
The date is the last day of the requested window. Choose it from available dates, including collected future days.
The title/category match ignores case and accents. Read `resumo.dias_consultados` before claiming coverage.
Save `agenda_ics` as an `.ics` file to import. Events use absolute UTC times; calendar apps display local time.
This file does not subscribe to future changes or create calendar events without the user's action.
No matching programme returns 404 before payment. Free daily reads remain the alternative for manual assembly.
Read the [task index](https://gradetv.net/llms.txt) for the matching contract.
TV playback, devices and chat passes are separate services.
Schedule metadata does not include a video archive or broadcast rights.

## Connect and pay

Use existing tools or `https://gradetv.net/mcp`; no local install is needed.
Read [prices](https://gradetv.net/api/pricing) and [payment](https://gradetv.net/api/billing).
Reuse existing rights and spending authority. Recover uncertain delivery before another payment.
Direct MCP x402 uses `params._meta["x402/payment"]`; HTTP uses `PAYMENT-SIGNATURE`.
An authenticated MCP connection already supplies access. Do not request another key or credit code.
For account API calls, use `X-Api-Key: mmk_…` or `Authorization: Bearer mmo_…` (OAuth).
On paid operations that accept account balance, that credential also authorizes payment.
Without an account, prepaid credit uses `Authorization: Bearer cred_…`. Keep credentials secret.
In `checkout=site`, the person purchases on the site. ChatGPT uses existing rights without sales.
If the task is playback, check channel health before recommending a stream.
