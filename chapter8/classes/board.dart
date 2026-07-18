import 'tile.dart';
import 'unit.dart';

// The 2D board from Chapter 7. Its methods all take (x, y) coordinates.
class Board {
  final int width;
  final int height;
  late List<List<Tile>> tiles;

  Board(this.width, this.height) {
    tiles = List.generate(
      width,
      (i) => List.generate(height, (j) => Tile()),
    );
  }

  Tile getTile(int x, int y) => tiles[x - 1][y - 1];

  void addUnit(Unit unit, int x, int y) => getTile(x, y).addUnit(unit);

  void removeUnit(Unit unit, int x, int y) => getTile(x, y).removeUnit(unit);

  void removeUnits(int x, int y) => getTile(x, y).removeUnits();

  List<Unit> getUnits(int x, int y) => getTile(x, y).getUnits();
}
