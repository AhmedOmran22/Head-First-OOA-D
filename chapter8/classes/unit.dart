import 'weapon.dart';

// The GSF Unit from Chapter 7 — good SRP: its one responsibility is storing a
// unit's type and properties. Here it also demonstrates COMPOSITION: the Unit
// OWNS a Weapon and can swap it at runtime.
class Unit {
  final String type;
  final Map<String, Object> _properties = {};

  Unit(this.type);

  void setProperty(String name, Object value) => _properties[name] = value;

  Object? getProperty(String name) => _properties[name];

  // Composition: the Unit's Weapon is part of the Unit and swappable at runtime.
  Weapon? get weapon => _properties['weapon'] as Weapon?;

  set weapon(Weapon? w) {
    if (w != null) _properties['weapon'] = w;
  }

  void attack() {
    if (weapon == null) {
      print('  $type has no weapon.');
    } else {
      print('  $type attacks:');
      weapon!.attack();
    }
  }

  @override
  String toString() => '$type $_properties';
}
