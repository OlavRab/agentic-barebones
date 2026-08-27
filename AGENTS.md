# AGENTS.md

Instructies voor elke coding agent (Claude Code, Cursor, Copilot, etc.) die in deze
repo werkt. Dit bestand is de enige bron van waarheid — tool-specifieke configs
(`CLAUDE.md`, `.cursor/rules`, `.github/copilot-instructions.md`, ...) verwijzen
hierheen in plaats van instructies te dupliceren.

## Workflow: spec-driven via OpenSpec

Alle non-triviale wijzigingen lopen via OpenSpec, niet direct code schrijven.
Volledige workflow-instructies: [`openspec/AGENTS.md`](openspec/AGENTS.md) (indien
aanwezig) of `openspec/config.yaml`. Kort samengevat:

1. **Propose** — nieuwe `openspec/changes/<change-id>/proposal.md` + `tasks.md`
   opstellen voor de voorgestelde wijziging. Geen code.
2. **STOP — human-in-the-loop.** Wacht op expliciete goedkeuring van de proposal
   voordat je verder gaat. Niet zelfstandig doorpakken.
3. **Implement** — na goedkeuring: code schrijven tegen de goedgekeurde spec,
   taken uit `tasks.md` afvinken.
4. **Verify** — tests/lint draaien. Bij falen: max 3 pogingen zelf fixen, dan
   **STOP** en rapporteer aan mens i.p.v. verder proberen.
5. **STOP — human-in-the-loop.** Wacht op code-review/goedkeuring voordat je commit/PR maakt.
6. **Archive** — na goedkeuring: change verplaatsen naar `openspec/specs/` als
   nieuwe source of truth, PR/commit maken.

Zie ook [`.agents/rules/`](.agents/rules/) voor gedetailleerde stopgates en scope-grenzen.

## Human-in-the-loop stopgates (samenvatting)

Stop altijd en vraag expliciet toestemming bij:
- Voorstel (proposal) is klaar, vóór implementatie
- Implementatie is klaar, vóór commit/PR
- Destructieve acties (verwijderen, force-push, schema-wijzigingen, secrets)
- Scope-overschrijding: wijziging raakt meer dan de bestanden genoemd in `tasks.md`
- 3x falende tests/lint zonder oplossing

Volledige regels: [`.agents/rules/`](.agents/rules/).

## Commands

Gebruik altijd `make <target>` (`make help` voor overzicht), nooit losse
taalspecifieke commands verzinnen of gokken. Dit is de agent-agnostic
"commands"-laag — elke agent en elke mens roept dezelfde entrypoints aan, CI
gebruikt ze ook. Zie [`Makefile`](Makefile).

## Persoonlijke overrides

Wil je eigen, niet-gedeelde instructies toevoegen (voorkeuren, lokale setup)?
Zet die in `AGENTS.local.md` (root, gitignored) — nooit in `AGENTS.md` zelf.
Agent-agnostic equivalent van patronen als `CLAUDE.local.md`.

## Project-context

_Nog in te vullen: taal/stack, conventies, architectuur._
