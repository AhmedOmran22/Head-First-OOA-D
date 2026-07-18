// Head First OOA&D — Chapter 8: Design Principles (Originality is Overrated)
//
// A pure design-principles chapter. This driver demonstrates the four
// principles — OCP, DRY, SRP, LSP — and the three alternatives to inheritance:
// delegation, composition, and aggregation.
import 'classes/automobile.dart';
import 'classes/board.dart';
import 'classes/car_wash.dart';
import 'classes/dog_door.dart';
import 'classes/driver.dart';
import 'classes/guitar_spec.dart';
import 'classes/instrument.dart';
import 'classes/mechanic.dart';
import 'classes/three_d_board.dart';
import 'classes/tire.dart';
import 'classes/unit.dart';
import 'classes/weapon.dart';

void main() {
  _ocpDemo();
  _dryDemo();
  _srpDemo();
  _lspAndDelegationDemo();
  _compositionDemo();
  _aggregationDemo();
}

// ── OCP: closed base matches(), open subclass override ───────────────────────

void _ocpDemo() {
  print('=== OCP: Open-Closed Principle ===');
  final target = GuitarSpec({'builder': 'Gibson', 'type': 'electric'}, 6);
  final wanted = GuitarSpec({'builder': 'Gibson'}, 6);
  final wrongStrings = GuitarSpec({'builder': 'Gibson'}, 12);

  print('Matches 6-string Gibson search? ${target.matches(wanted)}'); // true
  print('Matches 12-string search?       ${target.matches(wrongStrings)}'); // false
  print('');
}

// ── DRY: the auto-close timer lives only in DogDoor.open() ────────────────────
void _dryDemo() {
  print('=== DRY: Don\'t Repeat Yourself ===');
  final door = DogDoor();
  door.open(); // Remote and BarkRecognizer would both just call this.
  print('Door open? ${door.isOpen}');
  print('(Timer to auto-close lives in ONE place — DogDoor.open())');
  print('');
}

// ── SRP: each class has one responsibility ───────────────────────────────────
void _srpDemo() {
  print('=== SRP: Single Responsibility Principle ===');
  final car = Automobile(oil: 75);
  final driver = Driver('Gary');
  final mechanic = Mechanic();
  final carWash = CarWash();

  driver.drive(car); // Driver drives — not Automobile
  mechanic.checkOil(car); // Mechanic checks oil
  mechanic.changeTires(car, [Tire('Michelin'), Tire('Michelin'),
    Tire('Michelin'), Tire('Michelin')]);
  carWash.wash(car); // CarWash washes
  car.stop(); // Automobile stops itself
  print('');
}

// ── LSP + Delegation: ThreeDBoard delegates to Boards instead of inheriting ──
void _lspAndDelegationDemo() {
  print('=== LSP + Delegation: ThreeDBoard ===');
  final board3d = ThreeDBoard(10, 10, 5);
  final fighter = Unit('fighter');
  board3d.addUnit(fighter, 3, 4, 2); // 3D coords make sense here
  print('Units at (3, 4, 2): ${board3d.getUnits(3, 4, 2)}');
  print('ThreeDBoard has NO meaningless inherited 2D methods — no LSP violation.');

  // A plain 2D Board still works on its own terms.
  final board2d = Board(10, 10);
  board2d.addUnit(Unit('tank'), 5, 5);
  print('2D board units at (5, 5): ${board2d.getUnits(5, 5)}');
  print('');
}

// ── Composition: Unit OWNS a Weapon and can swap it at runtime ───────────────
void _compositionDemo() {
  print('=== Composition: Unit ◆── Weapon ===');
  final pirate = Unit('pirate');
  pirate.weapon = Sword();
  pirate.attack();

  pirate.weapon = Gun(); // swap behavior at runtime — inheritance can't do this
  pirate.attack();
  print('When the pirate is destroyed, its weapon goes with it (ownership).');
  print('');
}

// ── Aggregation: InstrumentSpec exists independently of Instrument ───────────
void _aggregationDemo() {
  print('=== Aggregation: Instrument ◇── InstrumentSpec ===');
  // The spec can exist on its own — e.g. a customer's search spec.
  final searchSpec = GuitarSpec({'builder': 'Fender'}, 6);
  final guitar = Instrument('V95693', 1499.95, searchSpec);
  print('Instrument ${guitar.serialNumber} uses a spec that also lives alone.');
  print('Spec matches itself? ${searchSpec.matches(guitar.spec)}');
  print('(Destroying the Instrument does NOT destroy the spec — aggregation.)');
}
