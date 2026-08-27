# .agents/rules/

Elk bestand hier is een losse regel/afspraak voor agents. Alle bestanden gelden
altijd, tenzij een `Scope:`-regel bovenaan het bestand iets anders zegt.

## Scoping-conventie

Standaard: een regelbestand geldt overal in de repo. Wil je een regel beperken
tot een deel van de codebase, zet dan bovenaan het bestand:

```
Scope: src/api/**
```

Tools die glob-scoped rule-loading ondersteunen (bv. Cursor) kunnen dit gebruiken
om de regel alleen te laden bij werk binnen dat pad. Tools zonder die
ondersteuning laden het bestand gewoon altijd — de `Scope:`-regel is dan puur
documentatie voor de agent zelf ("deze regel is alleen relevant binnen X").
Nooit een reden om de regel te negeren buiten scope; wel een signaal dat 'ie
daar minder relevant is.

## Editor-config

Team gebruikt uniform VS Code, dus `.vscode/settings.json` is hier bewust de
bron van waarheid voor formatting (indent, EOL, trailing whitespace) —
geen `.editorconfig` ernaast, dat zou dubbel zijn. Bij een team met gemengde
editors zou `.editorconfig` (universeel, geen vendor-lock) de voorkeur hebben
boven `.vscode/settings.json`.

## Huidige bestanden

- `stopgates.md` — verplichte stop-momenten (altijd, geen scope)
- `scope.md` — wat een agent wel/niet zonder overleg mag (altijd, geen scope)
- `enforcement.md` — technische afdwinging per tool, buiten repo (altijd, geen scope)

## MCP

`.mcp.json` in de root — team-wide, gecommit servers (project-scope). Iedereen
die de repo opent, krijgt dezelfde servers; de tool vraagt bij eerste gebruik
akkoord om ze te vertrouwen. MCP is een open protocol, dus dit is bewust
agent-agnostic bruikbaar, al kent niet elke tool exact dezelfde bestandslocatie
(Cursor: `.cursor/mcp.json`, VS Code Copilot: `.vscode/mcp.json`) — `.mcp.json`
in de root is de canonieke bron; symlink/dupliceer naar een tool-specifiek pad
alleen als het team die tool ook gebruikt.

**Nooit** secrets hardcoden in `.mcp.json` (het wordt gecommit) — gebruik
env-var-referenties (`${API_KEY}`) die naar ieders eigen `.env` wijzen.

Persoonlijke servers (niet gedeeld) horen niet in dit bestand: user-scope
(`claude mcp add --scope user ...`, landt in `~/.claude.json`, buiten de repo)
of local-scope (default, ook buiten de repo, persoonlijk + per-project).
