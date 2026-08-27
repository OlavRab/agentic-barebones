# Contributing

Deze repo is agent-agnostic en spec-driven (OpenSpec). Zowel mensen als agents
volgen dezelfde flow. Instructies voor agents staan in [`AGENTS.md`](AGENTS.md)
en [`.agents/rules/`](.agents/rules/) — dit document is de menselijke variant
van dezelfde afspraken.

## Flow: propose → implement → archive

1. **Propose** — nieuwe map `openspec/changes/<change-id>/` met `proposal.md`
   (wat & waarom) en `tasks.md` (concrete stappen). Nog geen code.
2. **Review** — proposal wordt besproken/goedgekeurd voordat implementatie
   start. Voor agents: dit is een verplichte stopgate, zie
   [`.agents/rules/stopgates.md`](.agents/rules/stopgates.md).
3. **Implement** — code tegen de goedgekeurde proposal, taken in `tasks.md`
   afvinken.
4. **Verify** — tests + lint lokaal groen voordat een PR open gaat.
5. **PR** — gebruik de PR-template, link naar `openspec/changes/<change-id>/`.
   CI checkt dit automatisch (`openspec-link` job).
6. **Archive** — na merge: change verplaatst naar `openspec/specs/` als nieuwe
   source of truth.

## Commit-conventie

[Conventional Commits](https://www.conventionalcommits.org/): `type(scope): omschrijving`.
Verwijs in de commit-body naar de change-id waar relevant, bv.:

```
feat(auth): add token refresh

Ref: openspec/changes/add-token-refresh/
```

## Review & eigenaarschap

Zie [`.github/CODEOWNERS`](.github/CODEOWNERS) — elke PR heeft menselijke
review nodig, ook agent-gegenereerde. Geen auto-merge.

## Voor agents

Zie [`AGENTS.md`](AGENTS.md) voor de volledige workflow-instructies en
[`.agents/rules/`](.agents/rules/) voor stopgates, scope-grenzen en
technische afdwinging.
