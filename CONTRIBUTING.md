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
   CI checkt dit automatisch (`openspec-link` job). Puur mechanische wijziging
   zonder spec-impact (bv. een CI/script-fix)? Zet dan `no-openspec: <reden>`
   in de PR-body i.p.v. een change-id — expliciete, beargumenteerde
   uitzondering, geen stille bypass.
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

## Branch protection

`main` is beschermd: geen direct push, CODEOWNERS-review verplicht, CI-checks
(`openspec-link`, `secret-scan`, `lint-and-test`, `build`) moeten slagen, geen
force-push/delete. Dit is een GitHub-repo-setting, niet af te dwingen vanuit
een bestand in de repo — vastgelegd als script zodat het reproduceerbaar is:

```
gh auth login   # eenmalig, admin-rechten op de repo nodig
./.github/scripts/apply-branch-protection.sh main
```

Opnieuw draaien na wijzigingen aan CI-jobnamen (die moeten matchen met de
`required_status_checks` in het script).

## Voor agents

Zie [`AGENTS.md`](AGENTS.md) voor de volledige workflow-instructies en
[`.agents/rules/`](.agents/rules/) voor stopgates, scope-grenzen en
technische afdwinging.
