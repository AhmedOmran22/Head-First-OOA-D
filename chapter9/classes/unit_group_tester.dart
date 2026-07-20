import 'unit.dart';
import 'unit_group.dart';

// Test cases 10–15 for the UnitGroup feature (the chapter numbers them 10+ to
// keep them distinct from the Unit property tests).
class UnitGroupTester {
  int _passed = 0;
  int _failed = 0;

  void runAll() {
    print('\n\nTesting the UnitGroup class...\n');
    testCreateFromList();
    testAddUnit();
    testGetUnitById();
    testGetAllUnits();
    testRemoveUnitById();
    testRemoveUnitByInstance();
    print('\nTest complete. Passed: $_passed, Failed: $_failed');
  }

  void _check(String label, bool condition) {
    if (condition) {
      _passed++;
      print('   Test passed. ($label)');
    } else {
      _failed++;
      print('   TEST FAILED. ($label)');
    }
  }

  List<Unit> _sampleUnits() => [Unit(100), Unit(101), Unit(102)];

  // Test 10 — Creating a UnitGroup from a list.
  void testCreateFromList() {
    print('Test 10: Creating a UnitGroup from a list of units.');
    final units = _sampleUnits();
    final group = UnitGroup(units);
    print('   ...Created a group from ${units.length} units');
    _check('group holds all 3 units', group.getUnits().length == 3);
  }

  // Test 11 — Adding a unit to a group. Starting state: an empty UnitGroup.
  void testAddUnit() {
    print('\nTest 11: Adding a unit to a group.');
    final group = UnitGroup.empty();
    group.addUnit(Unit(100));
    print('   ...Added unit with ID 100');
    _check('group contains unit 100', group.getUnit(100) != null);
  }

  // Test 12 — Getting a unit by its ID.
  void testGetUnitById() {
    print('\nTest 12: Getting a unit by its ID.');
    final group = UnitGroup.empty();
    group.addUnit(Unit(100));
    final unit = group.getUnit(100);
    print('   ...Getting unit with ID 100: $unit');
    _check('returned unit has ID 100', unit?.getId() == 100);
  }

  // Test 13 — Getting all the units in a group.
  void testGetAllUnits() {
    print('\nTest 13: Getting all the units in a group.');
    final units = _sampleUnits();
    final group = UnitGroup(units);
    final returned = group.getUnits();
    print('   ...Got ${returned.length} units back');
    // Note: Dart's == on Set compares identity, not contents — compare the
    // elements themselves.
    final returnedIds = returned.map((u) => u.getId()).toSet();
    final expectedIds = units.map((u) => u.getId()).toSet();
    final idsMatch = returnedIds.length == expectedIds.length &&
        returnedIds.containsAll(expectedIds);
    _check('returned list matches initial list', idsMatch);
  }

  // Test 14 — Removing a unit by ID.
  void testRemoveUnitById() {
    print('\nTest 14: Removing a unit by its ID.');
    final group = UnitGroup.empty();
    group.addUnit(Unit(100));
    group.removeUnitById(100);
    print('   ...Removed unit with ID 100');
    _check('unit 100 is gone', group.getUnit(100) == null);
  }

  // Test 15 — Removing a unit by passing the Unit instance.
  void testRemoveUnitByInstance() {
    print('\nTest 15: Removing a unit by its Unit instance.');
    final group = UnitGroup.empty();
    final unit = Unit(100);
    group.addUnit(unit);
    group.removeUnit(unit);
    print('   ...Removed the unit instance with ID 100');
    _check('unit 100 is gone', group.getUnit(100) == null);
  }
}
