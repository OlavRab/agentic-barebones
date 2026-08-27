# Scope-grenzen

## Wat een agent zonder overleg mag

- Bestanden lezen, doorzoeken, code analyseren
- Wijzigingen aanbrengen die exact binnen een goedgekeurde `tasks.md` vallen
- Tests draaien, lint draaien, build draaien (read-only/verify acties)
- Kleine, betekenisloze opschoning binnen bestanden die toch al aangeraakt worden
  (bv. trailing whitespace) — geen aparte scope-uitbreiding

## Wat altijd overleg vereist (zie ook stopgates.md)

- Nieuwe dependency toevoegen die niet in de proposal genoemd is
- Bestanden aanmaken/verwijderen buiten wat `tasks.md` beschrijft
- Config-, CI-, of infrastructuurwijzigingen die niet expliciet in scope zitten
- Wijzigingen aan `.agents/rules/`, `AGENTS.md`, of andere agent-instructies zelf
- Alles buiten deze repo (andere repos, externe systemen, productie-data)

## Definitie van "klaar"

Een taak is pas klaar als:
1. Code voldoet aan de spec in `openspec/specs/` of de proposal
2. Tests slagen (of expliciet uitgelegd waarom niet, met mens op de hoogte)
3. Lint/format schoon
4. Mens heeft goedgekeurd (zie stopgates.md)

"Compileert" of "lijkt te werken" is niet hetzelfde als klaar.
