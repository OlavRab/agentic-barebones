# agentic-barebones

Taalneutraal repo-skelet voor agentic development: spec-driven via
[OpenSpec](https://github.com/Fission-AI/OpenSpec), agent-agnostic (werkt met
Claude Code, Cursor, Copilot, of elke andere coding agent), met ingebouwde
human-in-the-loop stopgates.

Nog geen taal/toolchain gekozen — dat is de eerste stap bij gebruik van dit
skelet (zie hieronder).

## Waarom dit skelet

Agentic development zonder afspraken loopt vast op twee dingen: agents die
buiten scope gaan zonder het te melden, en tooling die per agent/IDE verschilt
zodat je conventies N keer moet vastleggen. Dit skelet lost beide op:

- **Eén bron van waarheid** voor agent-instructies (`AGENTS.md`), met dunne
  pointers vanuit tool-specifieke bestanden (`CLAUDE.md`, `.cursorrules`,
  `.github/copilot-instructions.md`) — geen duplicatie, geen drift.
- **Spec-driven flow** (OpenSpec) — elke wijziging start als voorstel, niet als
  code, met verplichte menselijke goedkeuring vóór implementatie én vóór merge.

## Structuur

```
AGENTS.md                  # enige bron van waarheid voor agent-instructies
AGENTS.local.md            # (optioneel, gitignored) je eigen, niet-gedeelde overrides
CONTRIBUTING.md            # dezelfde flow, uitgelegd voor mensen
Makefile                   # agent-agnostic command-laag: make help
.mcp.json                  # team-wide MCP-servers (leeg, vul zelf in)
.vscode/                   # editor-settings (team gebruikt VS Code)

.agents/rules/             # stopgates, scope-grenzen, technische afdwinging
  stopgates.md             #   wanneer moet een agent stoppen en wachten
  scope.md                 #   wat mag een agent wel/niet zonder overleg
  enforcement.md           #   hoe je dit technisch afdwingt per tool
  README.md                #   conventies: scoping, MCP, editor-config

openspec/                  # spec-driven workflow
  config.yaml              #   project-context & artifact-regels voor OpenSpec
  specs/                   #   geaccepteerde specs — source of truth huidig gedrag
  changes/                 #   voorstellen in behandeling
  changes/archive/         #   afgeronde, gearchiveerde changes

.github/
  workflows/ci.yml         #   lint/test + openspec-link-check + secret-scan
  workflows/build.yml      #   build
  workflows/ai-review.yml  #   placeholder voor AI-PR-review (nog geen vendor gekozen)
  PULL_REQUEST_TEMPLATE.md
  ISSUE_TEMPLATE/
  CODEOWNERS               #   TODO: vul echte owner in

design/  docs/  examples/  tests/   # leeg, klaar voor gebruik
```

## Aan de slag

1. **Kies taal/toolchain.** Vul dan in: `Makefile` (`lint`/`test`/`build`-targets),
   `.github/workflows/ci.yml` en `build.yml` (setup-actions), `.github/CODEOWNERS`
   (echte owner i.p.v. `@TODO-owner`).
2. **Lees [`AGENTS.md`](AGENTS.md)** — dit is wat elke agent (en jij) volgt.
3. **Werk via OpenSpec:**
   ```
   openspec change new <change-id>   # nieuw voorstel: proposal.md + tasks.md
   make openspec-list                # openstaande changes/specs tonen
   make openspec-validate             # structuur checken
   make openspec-view                 # interactief dashboard
   ```
4. **Volg de flow:** propose → **stop, wacht op goedkeuring** → implement →
   verify → **stop, wacht op review** → archive. Details in
   [`CONTRIBUTING.md`](CONTRIBUTING.md) en [`.agents/rules/stopgates.md`](.agents/rules/stopgates.md).

## Voor agents

Begin altijd bij [`AGENTS.md`](AGENTS.md). Gebruik `make help` voor commands —
nooit losse taalspecifieke commands gokken. Respecteer de stopgates in
[`.agents/rules/`](.agents/rules/): stoppen na een voorstel, stoppen vóór
commit/PR, nooit destructieve acties zonder bevestiging.

## Licentie

Zie [`LICENSE`](LICENSE).
