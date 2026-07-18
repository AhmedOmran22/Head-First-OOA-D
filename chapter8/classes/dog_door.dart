// ── DRY: Don't Repeat Yourself ───────────────────────────────────────────────
//
// The auto-close timer once lived in BOTH Remote.pressButton() and
// BarkRecognizer.recognize() — the same behavior in two places (a DRY
// violation). DRY says: one behavior, one sensible place. So the timer lives
// here in DogDoor.open(), and everyone else just calls open().
class DogDoor {
  bool _open = false;

  bool get isOpen => _open;

  void open() {
    print('The dog door opens.');
    _open = true;
    // Timer lives in ONE place — one behavior, one home.
    Future.delayed(const Duration(seconds: 5), close);
  }

  void close() {
    print('The dog door closes.');
    _open = false;
  }
}
