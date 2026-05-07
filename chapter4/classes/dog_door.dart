import 'bark.dart';

class DogDoor {
  bool _isOpen;
  List<Bark> _allowedBarks;

  DogDoor({required bool isOpen}) : _isOpen = isOpen, _allowedBarks = [];

  bool get isOpen => _isOpen;
  List<Bark> get allowedBarks => _allowedBarks;

  void addAllowedBark(Bark bark) {
    _allowedBarks.add(bark);
  }

  void open() {
    print('The door is opening...');
    
    _isOpen = true;
  }

  void close() {
    print('The door is closing...');
    _isOpen = false;
  }
}
