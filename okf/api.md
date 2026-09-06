---
type: "API"
title: "API do Grade"
description: "Superfície HTTP e MCP do Grade, com o modelo de cobrança."
resource: "https://gradetv.net/api/"
---

# API do Grade

Base: https://gradetv.net

## Como pagar

Catálogo e saúde de canal são grátis. Chat por canal e contato de agente cobram por requisição (x402) ou descontam de crédito pré-pago. Projetos de transmissão autorizada para produtores são recebidos sob consulta em /api/producers; o contato não contrata nem ativa o serviço.

## Endpoints

* `GET /okf/:arquivo` — Bundle OKF (Open Knowledge Format v0.1): markdown com frontmatter para o agente ler o produto inteiro sem parsear HTML.
* `GET /.well-known/:arquivo` — Descoberta de máquina antes da home: `api-catalog` (RFC 9727, linkset com a API e o MCP), `security.txt` (RFC 9116) e `mcp-registry-auth` (chave do registro oficial de MCP).
* `GET /apis.json` — APIs.json (apisjson.org, 0.19): o índice que o APIs.io colhe — a API, o MCP, OpenAPI, guia e bundle OKF num arquivo só. Também em `/.well-known/apis.json`.
* `GET /api/` — Índice auto-descrito da API inteira, com os idiomas e as páginas HTML de cada um.
* `GET /api/health` — Liveness e o commit publicado agora — é como o smoke espera o próprio deploy.
* `POST /mcp` — Servidor MCP por HTTP (Streamable HTTP, JSON-RPC 2.0) — pluga no cliente sem instalar nada.
* `GET /api/channels` — Busca paginada do catálogo público, com as facetas de categoria da busca atual.
* `GET /api/channels/:id` — Ficha completa de um canal, com os streams já apontando para o nosso hop.
* `GET /api/channels/:id/health` — Por que o canal falha, para quem e onde — inclui geo-bloqueio, latência por região e o veredito de quem está chamando.
* `GET /api/channels/:id/guia` — Programação de hoje do canal, grabada por nós: o que está no ar agora e o que vem a seguir.
* `GET /api/geo` — País e idioma sugeridos pela borda da Cloudflare para quem está chamando.
* `GET /api/countries` — Países que têm canal tocável, com a contagem e a bandeira de cada um.
* `GET /api/tags` — Tags das estações de rádio tocáveis (vocabulário livre do Radio Browser), com a contagem de cada uma.
* `GET /api/categories` — Vocabulário de categorias do iptv-org, com ícone para a interface.
* `GET /api/languages` — Idiomas que têm canal tocável, com a contagem de cada um.
* `GET /api/networks` — Redes e emissoras que têm canal tocável, com a contagem.
* `GET /api/qualities` — Qualidades distintas encontradas nos streams do catálogo (em rádio, codec e bitrate).
* `GET /api/subdivisions` — Estados e províncias que têm canal tocável.
* `GET /api/cities` — Cidades que têm canal tocável, filtráveis por país e por estado.
* `GET /api/producers` — Oferta sob consulta para produtores com conteúdo autorizado e canais de contato.
* `GET /logos/:id` — Logo do canal servido por nós, na variante de card (≤256px).
* `GET /api/s/:id` — Hop do stream: conta o play (uma vez por pessoa, canal e dia) e devolve a playlist da origem com as URIs absolutas, ou 302 para ela.
* `GET /api/m/:ticket` — Desligado: era o pass-through de vídeo. Responde 410 sempre.
* `GET /f/:token/library.:formato` — Feed da biblioteca inteira do dono, no formato pedido pela extensão.
* `GET /f/:token/c/:categoria.:formato` — Feed de uma pasta da biblioteca, para assinar só aquele recorte.
* `GET /f/:token/c/:categoria/g/:grupo.:formato` — Feed de uma sub-aba — o recorte mais fino que a galeria oferece.
* `POST /api/guest` — Cria um convidado `ipt_…` — é a identidade que guarda galeria, histórico e favoritos.
* `POST /api/keys` — Cria uma API key `iptk_…` para o agente — o texto completo aparece uma vez só.
* `GET /api/keys` — Lista as chaves do dono, sempre mascaradas, inclusive as já revogadas.
* `DELETE /api/keys/:id` — Revoga uma chave. A linha continua na listagem, marcada como revogada.
* `GET /api/library` — A galeria inteira do dono: pastas, sub-abas, canais e as URLs de feed de cada nível.
* `POST /api/categories` — Cria uma pasta na galeria, já com a sub-aba Geral dentro dela.
* `PATCH /api/categories/:id` — Renomeia uma pasta. O slug do feed acompanha o nome novo.
* `DELETE /api/categories/:id` — Apaga a pasta e tudo que está dentro dela: sub-abas e canais.
* `POST /api/groups` — Cria uma sub-aba dentro de uma pasta.
* `DELETE /api/groups/:id` — Apaga uma sub-aba e os canais que estavam nela.
* `POST /api/items` — Põe um canal do catálogo numa sub-aba da galeria.
* `DELETE /api/items/:id` — Tira um canal da sub-aba. O canal continua no catálogo público, claro.
* `POST /api/items/:id/play` — Marca este canal como o último tocado da sub-aba — é o que devolve a pessoa onde parou.
* `GET /api/history` — Canais que o dono assistiu, do mais recente para o mais antigo.
* `POST /api/history` — Registra que o dono assistiu um canal. Repetir soma em `plays` e sobe a linha.
* `DELETE /api/history/:channel_id` — Tira um canal do histórico do dono.
* `DELETE /api/history` — Limpa o histórico inteiro do dono, de uma vez.
* `GET /api/nsfw-consent` — Estado do portão adulto do dono: se vale, qual versão dos termos e a idade mínima.
* `POST /api/nsfw-consent` — Declara a idade e aceita os termos de conteúdo adulto.
* `DELETE /api/nsfw-consent` — Revoga o consentimento; o portão adulto fecha de novo na hora.
* `POST /api/nsfw/pass` — Compra o passe de conteúdo adulto: $0.10 por 30 dias, via x402.
* `GET /api/nsfw/pass` — Situação do passe adulto do dono: se vale e até quando.
* `POST /api/play-report` — Relata se o canal tocou ou falhou — é o que alimenta a saúde pública do catálogo.
* `GET /api/play-reports` — Relatos crus, com endereço IP, para investigar um canal — só operador.
* `GET /api/favorites` — Canais favoritados pelo dono, do mais recente para o mais antigo.
* `POST /api/favorites` — Favorita um canal. Repetir não soma: o contador público conta pessoas, não cliques.
* `DELETE /api/favorites/:channel_id` — Desfavorita o canal e devolve o ponto ao contador público.
* `GET /api/channels/:id/comments` — Comentários públicos de um canal, do mais novo para o mais antigo.
* `POST /api/channels/:id/comments` — Escreve um comentário no canal. Teto de 20 por hora por dono.
* `DELETE /api/comments/:id` — Apaga um comentário seu. Comentário alheio responde 404, não 403.
* `GET /api/chat/:channel_id/mensagens` — Últimas mensagens da sala do canal, mais o endereço do WebSocket para acompanhar ao vivo.
* `POST /api/chat/:channel_id/mensagens` — Manda mensagem na sala sem abrir WebSocket. Exige o passe mensal do chat.
* `POST /api/chat/pass` — Compra ou confirma o passe mensal do chat: $0.10 por 30 dias, via x402.
* `GET /api/chat/:channel_id/ws` — WebSocket da sala do canal — o caminho ao vivo, com presença.
* `POST /api/auth/start` — Manda um código de 6 dígitos por e-mail para criar a conta ou entrar nela.
* `POST /api/auth/verify` — Troca o código por uma sessão e devolve o convidado que a conta já tinha.
* `POST /api/auth/claim` — Liga um convidado a uma sessão já aberta, sem passar pelo código de novo.
* `POST /api/auth/logout` — Encerra a sessão. A linha some do banco, não fica marcada como inativa.
* `GET /api/me` — A conta da sessão: e-mail, convidado principal e o tamanho da biblioteca.
* `GET /api/billing` — Preços em vigor, tetos da galeria e a configuração x402 completa.
* `POST /api/contact` — Contato e projetos de produtores: humano usa Turnstile; agente paga $0.10 por x402 ou crédito.
* `POST /api/visit` — Ping da interface que incrementa a visita do dia. Agente não precisa chamar.
* `GET /api/metrics` — Métricas dos últimos 7 dias. Com o token do operador, inclui os pagamentos.
* `GET /api/admin/catalogo/estado` — Contagens do catálogo no ar e do staging, mais o carimbo da última recarga.
* `GET /api/admin/catalogo/slugs` — Slug publicado de cada canal, paginado por id — a recarga herda para não trocar URL indexada.
* `POST /api/admin/catalogo/inicio` — Abre o staging da recarga: as tabelas `*_novo` nascem vazias e o que sobrou de execução interrompida cai.
* `POST /api/admin/catalogo/lote` — Grava até 1000 linhas de UMA tabela no staging, num batch com no máximo 100 parâmetros por statement.
* `POST /api/admin/guia/lote` — Grava o dia de programação de até 500 canais em `guia_dia` (INSERT OR REPLACE).
* `POST /api/admin/guia/fim` — Registra a fonte `guia` em `catalog_meta.fontes`, ao lado das fontes do catálogo.
* `GET /api/admin/logos/mortas` — Canais de TV cuja origem de logo morreu (o cron já falhou ao buscá-la) e ainda não têm override.
* `POST /api/admin/logos/overrides` — Grava overrides de logo (`logo_overrides`, INSERT OR REPLACE): a ficha passa a usar a URL nova e o cron a espelha no R2.
* `POST /api/admin/catalogo/troca` — Confere o staging e troca o catálogo inteiro num único batch: ou tudo entra, ou nada muda.
* `POST /api/admin/catalogo/delta/inicio` — Abre a recarga por diferença: coleira contra o catálogo no ar e a marca da execução.
* `POST /api/admin/catalogo/delta` — Aplica no catálogo vivo, num batch, até 1000 linhas de UMA tabela: `upsert` entra ou atualiza, `remover` apaga por chave.
* `POST /api/admin/catalogo/delta/fim` — Confere o catálogo inteiro contra `esperado` e grava o carimbo (`synced_at`) — só se bateu.
* `POST /api/credito` — Recarrega crédito pré-pago: paga uma vez com x402 e recebe o token que desconta em qualquer API da casa.
* `GET /api/credito` — Saldo e extrato do crédito — as últimas movimentações, sem devolver o token.

Catálogo completo: https://gradetv.net/llms-full.txt · OpenAPI: https://gradetv.net/openapi.json
