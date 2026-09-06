#!/usr/bin/env bash
# Grade TV — free calls, no account. Chamadas grátis, sem cadastro.
set -euo pipefail

# Canais tocáveis do Brasil
curl -s 'https://gradetv.net/api/channels?country=BR&playable=1'

# Buscar um canal
curl -s 'https://gradetv.net/api/channels?q=tv%20senado'

# Países com canal tocável
curl -s https://gradetv.net/api/countries
