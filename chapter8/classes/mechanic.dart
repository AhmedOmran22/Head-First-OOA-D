import 'automobile.dart';
import 'tire.dart';

// ── SRP: tire-changing and oil-checking belong to the Mechanic ───────────────
class Mechanic {
  void changeTires(Automobile car, List<Tire> newTires) {
    car.tires = newTires;
    print('The mechanic changes the tires to: ${newTires.join(', ')}.');
  }

  void checkOil(Automobile car) {
    print('The mechanic checks the oil: ${car.getOil()}.');
  }
}
