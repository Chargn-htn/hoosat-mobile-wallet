/// How long to wait before retry number [failures] (1 = the first retry):
/// [base], then three times as long after each further failure, never more
/// than [max].
///
/// Built by multiplying in a loop that stops at [max], so a long outage (many
/// failures in a row) can never overflow into a zero or negative wait, which
/// would mean "try again immediately, over and over".
Duration retryDelay(
  int failures, {
  Duration base = const Duration(seconds: 5),
  Duration max = const Duration(seconds: 60),
}) {
  final cap = max.inMilliseconds;
  var ms = base.inMilliseconds;
  for (var i = 1; i < failures && ms < cap; i++) {
    ms *= 3;
  }
  return Duration(milliseconds: ms < cap ? ms : cap);
}
