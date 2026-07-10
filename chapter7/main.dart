import 'classes/board.dart';
import 'classes/unit.dart';

void main() {
  // Game designer creates a board with a height and width.
  final board = Board(20, 20);
  print('Board created (${board.width} x ${board.height}).\n');

  // Key Feature #2 — game-specific units built with the flexible Map approach.
  // Notice: no Tank/Army/Artillery subclasses needed. Any game, any properties.
  final tank = Unit('tank')
    ..setProperty('attack', 12.0)
    ..setProperty('experience', 22.0)
    ..setProperty('defense', 9.5)
    ..setProperty('owner', 'Player 2');

  final army = Unit('army')
    ..setProperty('size', 3000)
    ..setProperty('owner', 'Player 2');

  final artillery = Unit('artillery')
    ..setProperty('range', 15)
    ..setProperty('owner', 'Player 1');

  final subs = Unit('submarine')
    ..setProperty('depth', 200)
    ..setProperty('owner', 'Player 1');

  // Player 2 moves tanks onto (4, 5).
  board.addUnit(tank, 4, 5);
  print('Player 2 moves tank onto (4, 5).');

  // Player 2 moves army onto (4, 5).
  board.addUnit(army, 4, 5);
  print('Player 2 moves army onto (4, 5).');

  // Player 1 moves artillery onto (4, 5).
  board.addUnit(artillery, 4, 5);
  print('Player 1 moves artillery onto (4, 5).');

  // Game requests units from (4, 5).
  print('\nGame requests units from (4, 5):');
  for (final unit in board.getUnits(4, 5)) {
    print('  $unit');
  }

  // Player 1 battles Player 2 — Player 2's units win the battle.
  print('\nPlayer 1 battles Player 2. Player 2 wins!');

  // Player 1's units are removed from (4, 5). (Missing requirement the scenario
  // exposed — removeUnit() was added to Board and Tile because of this.)
  board.removeUnit(artillery, 4, 5);
  print("Player 1's artillery is removed from (4, 5).");

  print('\nUnits remaining at (4, 5):');
  for (final unit in board.getUnits(4, 5)) {
    print('  $unit');
  }

  // Player 1 moves subs to (2, 2).
  board.addUnit(subs, 2, 2);
  print('\nPlayer 1 moves submarine to (2, 2).');
  print('Units at (2, 2):');
  for (final unit in board.getUnits(2, 2)) {
    print('  $unit');
  }

  // removeUnits() — clear an entire tile at once.
  board.removeUnits(4, 5);
  print('\nAll units cleared from (4, 5). '
      'Remaining: ${board.getUnits(4, 5).length}');
}
