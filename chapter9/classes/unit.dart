import 'weapon.dart';

// Thrown when client code violates the getProperty() contract by asking for a
// property that doesn't exist. Dart exceptions are all unchecked, which matches
// the Java RuntimeException the chapter chose — Sue's team doesn't want to wrap
// every getProperty() call in a try/catch.
class PropertyNotFoundException implements Exception {
  final String message;

  PropertyNotFoundException(this.message);

  @override
  String toString() => 'PropertyNotFoundException: $message';
}

// package headfirst.gsf.unit
//
// The completed Unit class. This uses Sam's COMMONALITY-focused solution: the
// properties every unit shares (id, type, name, weapons) get their own typed
// fields and methods, while game-specific properties live in the Map.
//
// The tradeoff (acknowledged, not ignored): there are now two ways to reach a
// property, which risks DRY violations — but making it explicit that id, type,
// name, and weapons are standard for all units was judged worth it.
class Unit {
  final int _id; // set in the constructor — no setId() needed
  String _type;
  String? _name;

  // Lazily initialized: with thousands of units, allocating an empty List and
  // Map for every one wastes memory. Only build them when first used.
  List<Weapon>? _weapons;
  Map<String, Object>? _properties;

  Unit(this._id) : _type = '';

  int getId() => _id;

  String getType() => _type;

  void setType(String type) => _type = type;

  String? getName() => _name;

  void setName(String name) => _name = name;

  void addWeapon(Weapon weapon) {
    _weapons ??= [];
    _weapons!.add(weapon);
  }

  List<Weapon>? getWeapons() => _weapons;

  void setProperty(String property, Object value) {
    _properties ??= {};
    _properties![property] = value;
  }

  // ── Programming by contract ────────────────────────────────────────────────
  // The contract: "Ask me for a property that doesn't exist and I throw."
  // We trust the caller not to ask for things that aren't there. This replaced
  // the earlier contract of quietly returning null.
  Object getProperty(String property) {
    if (_properties == null) {
      throw PropertyNotFoundException('No properties for this Unit.');
    }
    final value = _properties![property];
    if (value == null) {
      throw PropertyNotFoundException(
          'Request for non-existent property: $property');
    }
    return value;
  }

  @override
  String toString() => 'Unit#$_id($_type)';
}
