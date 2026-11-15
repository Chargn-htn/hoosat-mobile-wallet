import 'dart:async';


bool _has(Object e, List<String> parts) {
  final t = e.toString().toLowerCase();
  return parts.any(t.contains);
}

bool isWalletLockedError(Object e) => _has(e, ['wallet is locked']);
bool isRateLimitError(Object e) => _has(e, ['rate limit']);
bool isTooNewError(Object e) => _has(e, [
      'minimum input age',
      'immature',
      'virtual utxo set',
      'every input must be',
    ]);

/// The node reports too little spendable money (some coins may be too new).
bool isNotEnoughFundsError(Object e) => _has(e, ['not enough funds']);

/// The node did not answer in time. The send may or may not have gone through.
/// (A gRPC "deadline exceeded" is the same thing.)
bool isTimeoutError(Object e) =>
    e is TimeoutException || _has(e, ['timed out', 'timeout', 'deadline']);

/// The node says it already has this transaction or already spent these
/// coins -- i.e. an earlier try of the same send did arrive.
bool isAlreadyHandledError(Object e) => _has(e, [
      'already in the mempool',
      'already spent',
      'double spend',
      'already exists',
    ]);

/// The wallet could not reach the node. Deliberately NOT the bare words
/// "grpc" or "connection": a node that answers with a rejection also arrives
/// as a gRPC error, and that is not a lost connection.
bool isConnectionError(Object e) => _has(e, [
      'unavailable',
      'socket',
      'connection refused',
      'connection reset',
      'connection closed',
      'connection error',
      'failed host lookup',
      'network is unreachable',
    ]);

/// Turns a technical error into a sentence a person can act on. The raw error
/// text is never shown here (callers log it).
String friendlyError(Object error) {
  final plain = _plain(error);
  return plain;
}

String _plain(Object e) {
  if (isWalletLockedError(e)) {
    return 'The wallet locked itself while it was working (for example the '
        'screen turned off). Unlock it and try again.';
  }
  if (isRateLimitError(e)) {
    return 'The network only accepts a few transactions per minute. Wait a '
        'minute, then try again.';
  }
  if (isAlreadyHandledError(e)) {
    return 'The network says it already has this transaction, or has already '
        'spent these coins, so it may have gone through. Check your activity '
        'before trying again.';
  }
  if (isTimeoutError(e)) {
    return 'The node did not answer in time, so the payment may or may not '
        'have gone through. Check your activity before trying again.';
  }
  if (isTooNewError(e)) {
    return 'Some of these coins are too new to spend yet (they need about 4 '
        'to 5 minutes). Try again a little later.';
  }
  if (isNotEnoughFundsError(e)) {
    return 'There is not enough spendable money for this right now. Some '
        'coins may still be arriving: Home shows what is available.';
  }
  if (_has(e, ['spam'])) {
    return 'The network refused this transaction because it would create too '
        'many new coins. Nothing was sent.';
  }
  if (isConnectionError(e)) {
    return 'The wallet lost contact with the node. Check the green dot. If '
        'you were sending, look at your activity before trying again, in '
        'case it went through.';
  }
  return 'Something went wrong. Please try again in a few minutes.';
}
