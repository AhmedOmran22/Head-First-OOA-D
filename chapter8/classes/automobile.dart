import 'tire.dart';

// ── SRP: Single Responsibility Principle ─────────────────────────────────────
//
// SRP analysis test: say "The Automobile ___s itself."
//   start()   → "The Automobile starts itself."   ✅ belongs here
//   stop()    → "The Automobile stops itself."     ✅ belongs here
//   getOil()  → "The Automobile gets its own oil." ✅ belongs here
//   drive()   → "The Automobile drives itself."    ❌ a Driver drives it
//   wash()    → "The Automobile washes itself."    ❌ a CarWash washes it
//   changeTires()/checkOil() → a Mechanic does those ❌
//
// So Automobile keeps only what it does to itself. The rest moved to Driver,
// CarWash, and Mechanic — each with its own single responsibility.
class Automobile {
  int _oil;
  List<Tire> tires;
  bool running = false;

  Automobile({int oil = 100, List<Tire>? tires})
      : _oil = oil,
        tires = tires ?? List.generate(4, (_) => Tire());

  void start() {
    running = true;
    print('The automobile starts.');
  }

  void stop() {
    running = false;
    print('The automobile stops.');
  }

  int getOil() => _oil;

  void setOil(int oil) => _oil = oil;
}
