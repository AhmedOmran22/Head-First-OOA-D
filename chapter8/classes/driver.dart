import 'automobile.dart';

// ── SRP: the "drive" responsibility lives on Driver, not Automobile ──────────
class Driver {
  final String name;

  Driver(this.name);

  void drive(Automobile car) {
    if (!car.running) car.start();
    print('$name drives the automobile.');
  }
}
