import 'dog_door.dart';

class BarkRecognizer {
  final DogDoor _dogDoor;

  BarkRecognizer({required DogDoor dogDoor}) : _dogDoor = dogDoor;

  void recognize(String bark) {
    print("BarkRecognizer: $bark");
    _dogDoor.open();
  }
}
