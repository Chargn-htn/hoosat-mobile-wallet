# Security policy

## Reporting a vulnerability

Please **do not** open a public issue or pull request for a security problem.

Use GitHub's private reporting instead: open the **Security** tab of this
repository, then **Report a vulnerability**. Only the maintainers can see what
you send.

Please include what you found, how to reproduce it (steps or a short proof),
which version or commit, and what you think the impact is (for example: funds
at risk, a seed or key exposed, the wrong amount or address used).

We will acknowledge your report as soon as we can and tell you when it is
fixed. Please give us a reasonable time to fix a problem before you share
details publicly.

## What matters most

This is a non-custodial wallet. Anything that could expose a seed phrase or
private key, sign something the user did not approve, send the wrong amount or
to the wrong address, or lose coins is a security problem. Good places to
start: signing (`lib/hoosat/wallet_service`, `lib/wallet_auth`), transaction
building (`lib/hoosat/transaction`), key and seed storage, and address and
amount handling in Send and Merge.

## Known limitations

- **The default node connection is not encrypted.** The wallet talks to its
  node over plain gRPC unless the node offers TLS (those nodes show a padlock in
  the node list). Anyone on the network path can see which addresses the app
  asks about and could show it wrong balances. They cannot change where a
  payment goes: transactions are built and signed on the phone.
- This is a pre-release wallet and has not had an independent security audit.

## Supported versions

The project is pre-release. Only the latest code on `main` is supported.

## Not security problems

Typos, layout glitches and feature requests are welcome as normal issues.
