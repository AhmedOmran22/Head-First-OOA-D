import 'unit.dart';

// Test cases 1–4 for the Unit properties feature.
//
// Every test here has the 5 parts of a good test case: an ID and a descriptive
// name, ONE specific thing it tests (atomic), an input, an expected output, and
// a starting state. Test 4 covers *incorrect* usage — the cases that catch bugs
// before the customer does.
class UnitTester {
  int _passed = 0;
  int _failed = 0;

  void runAll() {
    print('Testing the Unit class...\n');
    testCommonProperty();
    testUnitSpecificProperty();
    testChangingPropertyValue();
    testNonExistentProperty();
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

  // Test 1 — Setting/getting a common property. Input: "type", "infantry".
  void testCommonProperty() {
    print('Test 1: Setting and getting a common property (type).');
    final unit = Unit(1); // starting state: an existing Unit
    print('   ...Created a new unit');
    unit.setType('infantry');
    print('   ...Set "type" to "infantry"');
    print('   ...Getting unit type: "${unit.getType()}"');
    _check('type == infantry', unit.getType() == 'infantry');
  }

  // Test 2 — Setting/getting a unit-specific property. Input: "hitPoints", 25.
  void testUnitSpecificProperty() {
    print('\nTest 2: Setting and getting a unit-specific property.');
    final unit = Unit(2);
    print('   ...Created a new unit');
    unit.setProperty('hitPoints', 25);
    print('   ...Set "hitPoints" to 25');
    final hitPoints = unit.getProperty('hitPoints');
    print('   ...Getting unit hitPoints: $hitPoints');
    _check('hitPoints == 25', hitPoints == 25);
  }

  // Test 3 — Changing an existing property's value.
  // Starting state: a Unit with hitPoints already set to 25.
  void testChangingPropertyValue() {
    print('\nTest 3: Changing an existing property\'s value.');
    final unit = Unit(3);
    print('   ...Created a new unit');
    unit.setProperty('hitPoints', 25);
    print('   ...Set "hitPoints" to 25');
    unit.setProperty('hitPoints', 15);
    print('   ...Set "hitPoints" to 15');
    final hitPoints = unit.getProperty('hitPoints');
    print('   ...Getting unit hitPoints: $hitPoints');
    _check('hitPoints == 15', hitPoints == 15);
  }

  // Test 4 — Getting a non-existent property.
  //
  // This test was REWRITTEN when the contract changed. Under the old contract
  // it checked for null; under the new programming-by-contract behavior, the
  // expected outcome is that an exception IS thrown. Reaching the line after
  // getProperty() means no exception fired — that's a failure.
  void testNonExistentProperty() {
    print('\nTest 4: Getting a non-existent property\'s value.');
    final unit = Unit(4);
    print('   ...Created a new unit');
    unit.setProperty('hitPoints', 25);
    print('   ...Set "hitPoints" to 25');
    try {
      final value = unit.getProperty('strength');
      print('   ...Getting unit strength: $value');
      _check('expected an exception', false); // no exception → failed
    } on PropertyNotFoundException catch (e) {
      print('   ...Getting unit strength threw: ${e.message}');
      _check('exception thrown as contracted', true);
    }
  }
}
