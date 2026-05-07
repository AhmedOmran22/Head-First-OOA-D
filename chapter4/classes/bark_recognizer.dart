import 'bark.dart';
import 'dog_door.dart';

class BarkRecognizer {
  final DogDoor _dogDoor;

  BarkRecognizer({required DogDoor dogDoor}) : _dogDoor = dogDoor;

  void recognize(Bark bark) {
    print('BarkRecognizer: Heard a bark: ${bark.sound}');
    for (Bark allowedBark in _dogDoor.allowedBarks) {
      if (allowedBark.equals(bark)) {
        _dogDoor.open();
        return;
      }
    }
    print("The dog door doesn't recognize that bark.");
  }
}
