class Bark {
  final String _sound;
  Bark({required String sound}) : _sound = sound;
  String get sound => _sound;

  bool equals(Object other) {
    if (other is Bark) {
      return _sound == other._sound;
    }
    return false;
  }
}
