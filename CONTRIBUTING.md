# Contributing to Hoosat Mobile Wallet

This is a non-custodial wallet that will hold real HTN. Access to this repo
is kept deliberately small and documented, so it's always clear who can
change what — see "Why" below.

## Merge rights (current, 2026-11-04)

- **Chargn** — sole maintainer with merge rights.
- **Foztor** will be added once the project reaches the iOS phase (he
  compiles/tests the iOS builds on his own Mac). Not added before then —
  no need to pull him in early.
- Anyone else gets added only with an explicit decision recorded here,
  updating this list.

## Workflow

- No direct pushes to `main`, even by the maintainer. All changes go
  through a feature branch and a pull request first.
- Keep PRs small and reviewable, especially anything touching signing,
  key storage, or seed handling.
- Never commit secrets, API keys, or seed/private key material, test or
  otherwise.

## Why this exists

The previous maintainer of this codebase controlled every credential,
account, and store listing alone, which became a real problem when he
left the project. This doc is the direct fix: a short, explicit, written
record of who can merge code, so that never happens again — not a
formality, an actual continuity measure for a wallet holding real funds.
