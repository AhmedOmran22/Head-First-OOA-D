// A stub — just enough to let Unit compile and be tested.
//
// The chapter deliberately does NOT flesh this out: you build only what the
// current feature needs, and avoid over-engineering things that aren't your
// job to build yet.
class Weapon {
  final String name;

  Weapon([this.name = 'unnamed weapon']);

  @override
  String toString() => name;
}
