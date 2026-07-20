// Head First OOA&D — Chapter 9: Iterating and Testing
//
// The software is still for the customer. Gary doesn't want more diagrams — he
// wants to see running code. So this entry point runs the actual test cases for
// the completed Unit and UnitGroup classes, printing exactly the kind of output
// you'd show a customer as proof the feature works.
import 'classes/unit.dart';
import 'classes/unit_group.dart';
import 'classes/unit_tester.dart';
import 'classes/unit_group_tester.dart';
import 'classes/weapon.dart';

void main() {
  // Feature driven development: we picked feature #3 (game-specific units) and
  // are developing it to completion — properties first, then groups.
  UnitTester().runAll();
  UnitGroupTester().runAll();

  _demo();
}

// A quick walkthrough of the finished Unit/UnitGroup API in real use.
void _demo() {
  print('\n\n=== Using the finished classes ===');

  final soldier = Unit(1)
    ..setType('infantry')
    ..setName('Simon')
    ..addWeapon(Weapon('Bazooka'))
    ..setProperty('hitPoints', 25)
    ..setProperty('experience', 3);

  print('Unit: $soldier');
  print('  name:       ${soldier.getName()}');
  print('  weapons:    ${soldier.getWeapons()}');
  print('  hitPoints:  ${soldier.getProperty('hitPoints')}');
  print('  experience: ${soldier.getProperty('experience')}');

  // Programming by contract: asking for something that isn't there throws,
  // rather than quietly handing back null.
  try {
    soldier.getProperty('strength');
  } on PropertyNotFoundException catch (e) {
    print('  asking for "strength" → ${e.message}');
  }

  // Group units into an army.
  final army = UnitGroup([soldier, Unit(2)..setType('tank')]);
  army.addUnit(Unit(3)..setType('artillery'));
  print('\nArmy has ${army.getUnits().length} units: ${army.getUnits()}');

  army.removeUnitById(2);
  print('After removing unit 2: ${army.getUnits()}');
}
