#!/usr/bin/env bash
# Applies branch protection to `main` as documented in
# .agents/rules/enforcement.md and CONTRIBUTING.md. Requires the `gh` CLI,
# logged in with admin rights on the repo. Idempotent — re-running overwrites
# the policy.
#
# Usage: ./apply-branch-protection.sh [branch]
set -euo pipefail

BRANCH="${1:-main}"
REPO="$(gh repo view --json nameWithOwner -q .nameWithOwner)"

echo "Applying branch protection to ${REPO}@${BRANCH} ..."

gh api \
  --method PUT \
  -H "Accept: application/vnd.github+json" \
  "repos/${REPO}/branches/${BRANCH}/protection" \
  -F "required_status_checks[strict]=true" \
  -f "required_status_checks[checks][][context]=PR linked to an OpenSpec change" \
  -f "required_status_checks[checks][][context]=Secret scan" \
  -f "required_status_checks[checks][][context]=Lint & test" \
  -f "required_status_checks[checks][][context]=Build" \
  -F "enforce_admins=true" \
  -F "required_pull_request_reviews[require_code_owner_reviews]=true" \
  -F "required_pull_request_reviews[required_approving_review_count]=1" \
  -F "restrictions=null" \
  -F "allow_force_pushes=false" \
  -F "allow_deletions=false"

echo "Done. Check: gh api repos/${REPO}/branches/${BRANCH}/protection"
