import 'classes/dog_door.dart';
import 'classes/bark_recognizer.dart';

Future<void> main() async {
  final door = DogDoor(isOpen: false);
  final recognizer = BarkRecognizer(dogDoor: door);

  // Simulate the hardware hearing a bark
  print("Fido starts barking.");
  recognizer.recognize("Woof");

  print("\nFido has gone outside...");

  print("\nFido's all done...");

  // Simulate some time passing
  await Future.delayed(const Duration(seconds: 10));

  print("...but he's stuck outside!");

  // Simulate the hardware hearing a bark again
  print("Fido starts barking.");
  recognizer.recognize("Woof");

  print("\nFido's back inside...");
}
