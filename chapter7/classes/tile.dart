import 'unit.dart';

class Tile {
  final List<Unit> _units = [];

  void addUnit(Unit unit) => _units.add(unit);

  void removeUnit(Unit unit) => _units.remove(unit);

  void removeUnits() => _units.clear();

  List<Unit> getUnits() => List.unmodifiable(_units);
}
