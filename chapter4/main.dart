import 'classes/bark.dart';
import 'classes/dog_door.dart';
import 'classes/bark_recognizer.dart';
import 'classes/remote.dart';

Future<void> main() async {
  final door = DogDoor(isOpen: false);
  final recognizer = BarkRecognizer(dogDoor: door);
  final remote = Remote(dogDoor: door);

  // Register Fido's bark so the door recognizes him
  door.addAllowedBark(Bark(sound: "Woof"));

  // --- Scenario 1: Fido wants to go outside ---
  print("Fido starts barking.");
  recognizer.recognize(Bark(sound: "Woof"));  // door opens

  print("\nFido has gone outside...");
  print("door is open: ${door.isOpen}");

  print("\nFido's all done outside. Owner uses the remote to let him back in.");
  remote.pressButton();  // closes door manually

  print("\n--- 5 seconds pass... (auto-close timer running) ---\n");
  await Future.delayed(const Duration(seconds: 6));

  // --- Scenario 2: Fido is stuck outside ---
  print("Fido starts barking again.");
  recognizer.recognize(Bark(sound: "Woof"));  // door opens again

  print("\nFido's back inside...");
  print("door is open: ${door.isOpen}");

  print("\nWaiting for auto-close...");
  await Future.delayed(const Duration(seconds: 6));
  print("door is open after auto-close: ${door.isOpen}");

  // --- Scenario 3: Stranger bark is rejected ---
  print("\nA stranger's dog barks.");
  recognizer.recognize(Bark(sound: "Arf"));   // not recognized
}
