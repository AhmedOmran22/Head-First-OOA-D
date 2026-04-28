import 'classes/dog_door.dart';
import 'classes/remote.dart';

void main() {
  final door = DogDoor(isOpen: false);
  final remote = Remote(dogDoor: door);
  print("Fido barks to go outside...");
  remote.pressButton();
  print("\nFido has gone outside...");
  // remote.pressButton();
  print("\nFido's all done...");
  // remote.pressButton();
  print("\nFido's back inside...");
  // remote.pressButton();
}
