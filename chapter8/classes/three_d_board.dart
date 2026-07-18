import 'board.dart';
import 'tile.dart';
import 'unit.dart';

// ── LSP + Delegation ─────────────────────────────────────────────────────────
//
// WRONG (LSP violation): `class ThreeDBoard extends Board`. A 3D board would
// inherit all the 2D (x, y) methods — but getUnits(4, 5) is meaningless on a 3D
// board, so ThreeDBoard is NOT substitutable for Board. Bad inheritance.
//
// RIGHT (this class): ThreeDBoard does NOT inherit from Board. It HOLDS an array
// of Boards (one per z-level) and DELEGATES its 3D methods to the right Board.
// No confusing inherited 2D methods, no LSP violation.
class ThreeDBoard {
  final List<Board> _boards;
  final int zSize;

  ThreeDBoard(int width, int height, this.zSize)
      : _boards = List.generate(zSize, (_) => Board(width, height));

  Tile getTile(int x, int y, int z) => _boards[z - 1].getTile(x, y); // delegate

  void addUnit(Unit unit, int x, int y, int z) =>
      _boards[z - 1].addUnit(unit, x, y); // delegate

  void removeUnit(Unit unit, int x, int y, int z) =>
      _boards[z - 1].removeUnit(unit, x, y); // delegate

  List<Unit> getUnits(int x, int y, int z) =>
      _boards[z - 1].getUnits(x, y); // delegate
}
