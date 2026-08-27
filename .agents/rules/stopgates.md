# Stopgates

Momenten waarop de agent verplicht stopt en op mens wacht — niet zelfstandig doorpakt,
ook niet als de vervolgstap "voor de hand ligt".

## Verplichte stops

1. **Na propose, vóór implement** — `proposal.md` + `tasks.md` staan klaar in
   `openspec/changes/<change-id>/`. Wacht op expliciete goedkeuring ("ga verder",
   "akkoord", etc.) voordat er code geschreven wordt.
2. **Na implement, vóór commit/PR** — code + tests staan klaar. Wacht op review/
   goedkeuring voordat er gecommit, gepusht, of een PR geopend wordt.
3. **Vóór elke destructieve actie** — bestanden/branches verwijderen, force-push,
   database-/schema-wijzigingen, secrets aanraken, dependencies met breaking
   changes updaten. Altijd expliciet bevestigen, ongeacht hoe klein de actie lijkt.
4. **Bij scope-overschrijding** — als de wijziging meer bestanden raakt dan in
   `tasks.md` genoemd, of een ander deel van de codebase dan de proposal beschrijft:
   stop, leg uit wat er extra nodig is, vraag akkoord.
5. **Na 3 mislukte pogingen** — test/lint/build blijft falen na 3 zelfstandige
   fix-pogingen. Stop, rapporteer wat geprobeerd is en waarom het niet werkt.
   Niet oneindig doorproberen.

## Wat niet hoeft te stoppen

- Lezen, zoeken, analyseren — altijd toegestaan zonder gate.
- Wijzigingen binnen scope van een al goedgekeurde `tasks.md`.
- Losse lint/format-fixes die geen gedrag wijzigen.

## Hoe stoppen

Rapporteer kort: wat is klaar, wat is de voorgestelde vervolgstap, wat wordt er
gevraagd van de mens (goedkeuring / keuze / correctie). Geen aannames maken over
het antwoord.
