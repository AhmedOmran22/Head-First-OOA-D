import 'unit.dart';

// Units grouped into armies.
//
// Backed by a Map<int, Unit> keyed on the unit's id: that gives O(1) lookup and
// removal by ID (a List would mean searching), and using the id as the key
// naturally enforces the no-duplicates rule.
class UnitGroup {
  final Map<int, Unit> _units = {};

  // Build a group from an existing list of units.
  UnitGroup(List<Unit> unitList) {
    for (final unit in unitList) {
      _units[unit.getId()] = unit;
    }
  }

  UnitGroup.empty();

  void addUnit(Unit unit) => _units[unit.getId()] = unit;

  void removeUnitById(int id) => _units.remove(id);

  void removeUnit(Unit unit) => removeUnitById(unit.getId());

  Unit? getUnit(int id) => _units[id];

  List<Unit> getUnits() => _units.values.toList();
}
