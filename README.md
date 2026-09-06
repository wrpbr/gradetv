# Grade TV

> Canais públicos de TV e rádio no browser e no VLC, com a saúde de cada canal medida.

**In English.** Grade TV is a catalogue of publicly available TV channels and radio stations (the iptv-org catalogue plus credited lists) with measured stream health, a player in the browser and folders that become a stable M3U/JSON/XSPF URL for VLC. It hosts no signal. UI in Portuguese, English, Spanish, French and German; free; API and remote MCP server.

**No ar:** https://gradetv.net · **Índice da API:** https://gradetv.net/api/ · **OpenAPI:** https://gradetv.net/openapi.json · **Servidor MCP:** https://gradetv.net/mcp · **Docs para agentes:** https://gradetv.net/llms.txt

## O que faz

A Grade TV é um diretório comunitário de transmissões públicas: TV aberta e rádio, no browser e no VLC.

O que faz: catálogo pesquisável (país, idioma, categoria, qualidade, guia), player com hls/mpegts/dash, pastas pessoais com URL estável de feed (M3U, JSON, XSPF) para o VLC ou qualquer player, e a saúde de cada canal medida de dois jeitos: cada play conta (tocou ou falhou, com o código e o ambiente) e um verificador externo dá nota 0–100 e data. Ordene por saúde, filtre quem está no ar.

## Começo rápido (sem cadastro)

Canais tocáveis do Brasil:

```bash
curl -s 'https://gradetv.net/api/channels?country=BR&playable=1'
```

Buscar um canal:

```bash
curl -s 'https://gradetv.net/api/channels?q=tv%20senado'
```

Países com canal tocável:

```bash
curl -s https://gradetv.net/api/countries
```

## Servidor MCP (remoto, sem instalar nada)

Streamable HTTP sobre a mesma API pública. Cada tool é uma chamada nesta API; o `operationId` do OpenAPI é o nome da tool. Cartão do servidor: `GET https://gradetv.net/mcp`.

Claude Code:

```bash
claude mcp add --transport http grade https://gradetv.net/mcp
```

Cursor (`.cursor/mcp.json`):

```json
{
  "mcpServers": {
    "grade": {
      "url": "https://gradetv.net/mcp"
    }
  }
}
```

Tools principais: `search_channels`, `get_channel`, `channel_health`, `get_channel_guide`, `list_countries`, `list_languages`, `list_networks`, `get_library`, `create_category`, `add_item`.

## Preço

**Grátis.** Catálogo, pastas, feeds M3U/JSON/XSPF e player, sem conta, em cinco idiomas.

**Pago.** Chat por canal US$ 0,10 por 30 dias; passe de conteúdo adulto US$ 0,10 por 30 dias (x402), sempre com o preço antes de cobrar.

## O que não é

Não hospeda sinal (o stream toca da origem do canal) e não é lista paga: só canais públicos, com pedido de remoção pelo contato.

## Arquivos deste repositório

| | |
|---|---|
| `README.md` | esta página |
| `openapi.json` | documento OpenAPI 3; `operationId` = nome da tool MCP |
| `llms.txt` | guia curto para agentes (rotas, auth, preço, MCP) |
| `llms-full.txt` | referência completa: parâmetros, corpo, resposta campo a campo, erros (quando publicada) |
| `apis.json` | índice APIs.json (APIs.io) |
| `mcp/server.json` | manifesto publicado no registro oficial de MCP (`net.gradetv/grade`) |
| `okf/` | bundle OKF: markdown com front-matter (índice, sobre, API, FAQ) |
| `examples/` | `curl.sh` e `python.py` com as chamadas grátis acima |

## Sobre este repositório

Este repositório espelha as superfícies públicas e legíveis por máquina do Grade TV, como servidas em https://gradetv.net: o documento OpenAPI, o guia `llms.txt`, o manifesto do registro MCP, o bundle OKF e o índice APIs.json. O produto em si não é código aberto; o espelho existe para a API e o servidor MCP poderem ser encontrados, lidos e linkados daqui. Os arquivos são regenerados das superfícies no ar (última sincronização: 2026-09-05); se algo aqui divergir do site, vale o site.

Issues e sugestões são bem-vindas aqui. Contato: contato@gradetv.net. Autor: Wendel ([@wrpbr](https://github.com/wrpbr)).
