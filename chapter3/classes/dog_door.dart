class DogDoor {
  bool _isOpen;
  DogDoor({required bool isOpen}) : _isOpen = isOpen;
  bool get isOpen => _isOpen;
  void open() {
    print('The door is opening...');
    _isOpen = true;
  }

  void close() {
    print('The door is closing...');
    _isOpen = false;
  }
}
