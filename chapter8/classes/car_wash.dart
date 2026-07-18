import 'automobile.dart';

// ── SRP: the "wash" responsibility lives on CarWash, not Automobile ──────────
class CarWash {
  void wash(Automobile car) {
    print('The car wash washes the automobile.');
  }
}
