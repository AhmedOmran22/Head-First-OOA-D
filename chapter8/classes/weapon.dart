// ── Composition / Aggregation: a family of interchangeable behaviors ─────────
//
// Weapon is an interface with many implementations. A Unit is COMPOSED with a
// Weapon (it owns one) and can swap it at runtime — something inheritance can't
// do. If weapons were SHARED and outlived their unit, that would be aggregation.
abstract class Weapon {
  void attack();
}

class Sword implements Weapon {
  @override
  void attack() => print('  Sword attack!');
}

class Gun implements Weapon {
  @override
  void attack() => print('  Gun fires!');
}

class Club implements Weapon {
  @override
  void attack() => print('  Club smash!');
}
