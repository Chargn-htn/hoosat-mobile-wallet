# Reviewing this wallet

This is a non-custodial wallet that handles real funds, so changes arrive as
many small pull requests, each in one area, instead of one large one. Each pull
request says what it changes, why, how it was tested, and what to look at.

## How to review a pull request
1. Read the description first. It lists what the change is, what it is not, and
   what to check.
2. Check out the branch and run:
   ```
   flutter pub get
   flutter analyze
   flutter test
   ```
   Both `analyze` and `test` must be clean.
3. Read the diff in the order the description suggests. Generated files (for
   example `*.g.dart`, `*.freezed.dart`, `lib/l10n/app_localizations*.dart`) do not
   need a line-by-line read.
4. Leave comments on the lines they apply to. Use "Request changes" for anything
   about correctness or security; style preferences are optional.

## Extra care for money-critical changes
Changes that touch signing, keys, the seed, coin selection, merging or sending
are marked money-critical and need two approvals. For these, please check:
- amounts and fees: no rounding, overflow or off-by-one that could lose or
  mis-send funds;
- the seed and keys never leave the secure store and are never logged or shown;
- every error path leaves the wallet in a safe state (coins are never marked
  spent unless the network accepted the transaction);
- any value compared against the node comes from the node's own code (the
  description shows how to re-derive it).

## What must never be in a pull request
Keys, seeds, tokens, personal data, private addresses, server names or internal
links, in code, tests or descriptions.
