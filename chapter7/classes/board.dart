import 'tile.dart';
import 'unit.dart';

class Board {
  final int width;
  final int height;
  late List<List<Tile>> tiles; // 2D array of tiles

  Board(this.width, this.height) {
    _initialize();
  }

  // Setup pulled into its own method — keeps the constructor readable (SRP).
  void _initialize() {
    tiles = List.generate(
      width,
      (i) => List.generate(height, (j) => Tile()),
    );
  }

  Tile getTile(int x, int y) {
    return tiles[x - 1][y - 1];
  }

  void addUnit(Unit unit, int x, int y) {
    getTile(x, y).addUnit(unit);
  }

  void removeUnit(Unit unit, int x, int y) {
    getTile(x, y).removeUnit(unit);
  }

  // Added because the Board Scenario revealed removing *all* units from a tile
  // was a missing requirement.
  void removeUnits(int x, int y) {
    getTile(x, y).removeUnits();
  }

  List<Unit> getUnits(int x, int y) {
    return getTile(x, y).getUnits();
  }
}
