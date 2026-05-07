
import 'dart:async';

import 'dog_door.dart';

class Remote {
  final DogDoor _dogDoor;
  Remote({required DogDoor dogDoor}) : _dogDoor = dogDoor;

  void pressButton() {
    print('Pressing the remote control...');
    if (_dogDoor.isOpen) {
      _dogDoor.close();
    } else {
      _dogDoor.open();
    }
    Timer.periodic(Duration(seconds: 5), (timer) {
      if (_dogDoor.isOpen) {
        _dogDoor.close();
      }
    });
  }
}
