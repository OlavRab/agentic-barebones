# Technische afdwinging van stopgates

`stopgates.md` en `scope.md` zijn instructies — een agent kan ze in theorie
negeren. Waar mogelijk hoort daar een technische grens bovenop, per tool anders
geconfigureerd. Dit bestand documenteert het principe agent-agnostic; de
daadwerkelijke config leeft in de tool-specifieke map van elke ontwikkelaar
(niet in deze repo, want dat zou de agent-agnostic opzet doorbreken — zie
eerdere afweging rond OpenSpec's `--tools none`).

## Principe

Elke tool met een permissions/hooks-mechanisme moet zo geconfigureerd worden dat:
- **Commit/push/PR-aanmaken** nooit zonder expliciete user-approval loopt
- **Destructieve commands** (`rm -rf`, `git push --force`, schema-drops) altijd
  een bevestigingsprompt triggeren, ook in "auto-accept"-achtige modi
- **Secrets/`.env`-bestanden** nooit door de agent zelf gelezen/ge-cat't worden
  richting output of commit

## Concreet: wat een dangerous-command hook moet blokkeren

Patronen die altijd een confirm-prompt moeten triggeren, ongeacht tool:
- `rm -rf`, `git clean -fd`
- `git push --force`, `git push -f`
- `git reset --hard` op gedeelde branches
- schema-migraties/drops, `DROP TABLE`, `TRUNCATE`
- `curl | sh` / `curl | bash` (onbekende scripts direct uitvoeren)
- alles dat `.env`, secrets, of credentials leest en naar output/commit stuurt

## AI PR-review

`.github/workflows/ai-review.yml` is een placeholder — nog geen vendor gekozen.
Zodra ingevuld: **altijd adviserend**, nooit gekoppeld aan auto-approve/auto-merge.
CODEOWNERS-goedkeuring door een mens blijft de harde eis, ongeacht wat een
AI-reviewer zegt.

## Per tool (voorbeeld, lokaal instellen — niet in repo)

- **Claude Code**: `.claude/settings.json` — `permissions` + `PreToolUse`/
  `PostToolUse` hooks die commit/push/destructieve bash-commands laten wachten
  op user-approval.
- **Cursor**: `.cursor/rules` + agent-mode permissions in settings.
- **GitHub Copilot (agent mode)**: workspace trust + confirmation settings.

Dit blijft per-ontwikkelaar/tool config, buiten versiebeheer van dit skelet —
zo blijft de repo zelf agent-agnostic terwijl elke agent alsnog technisch
begrensd kan worden.
