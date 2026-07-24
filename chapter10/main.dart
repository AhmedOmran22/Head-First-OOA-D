// Head First OOA&D — Chapter 10: The OOA&D Lifecycle
//
// The Objectville Travel RouteFinder — the whole book in one application, built
// through two full passes of the lifecycle:
//
//   Iteration 1 — "Load network of subway lines": Station, Connection, Subway,
//                 SubwayLoader, and LoadTester to prove it works.
//   Iteration 2 — "Get directions": Subway.getDirections() and SubwayPrinter.
//
// Usage:
//   dart run chapter10/main.dart
//   dart run chapter10/main.dart "Mighty Gumball, Inc." "Choc-O-Holic, Inc."
import 'dart:io';

import 'classes/load_tester.dart';
import 'classes/subway.dart';
import 'classes/subway_loader.dart';
import 'classes/subway_tester.dart';

void main(List<String> args) {
  final subway = _loadObjectvilleSubway();

  // ── Iteration 1: prove the network loaded ────────────────────────────────
  print('=== Iteration 1: Load network of subway lines ===\n');
  LoadTester().run(subway);

  // ── Iteration 2: prove we can route between stations ─────────────────────
  print('\n\n=== Iteration 2: Get directions ===\n');
  final tester = SubwayTester(subway);

  final from = args.isNotEmpty ? args[0] : 'Mighty Gumball, Inc.';
  final to = args.length > 1 ? args[1] : 'Choc-O-Holic, Inc.';

  if (!_printRoute(tester, from, to)) return;

  // A second route, to show line-switching handled on a different path.
  if (args.isEmpty) {
    print('');
    _printRoute(tester, "Boards 'R' Us", 'Algebra Alley');
  }
}

// The travel agent shouldn't see a stack trace when they mistype a station.
bool _printRoute(SubwayTester tester, String from, String to) {
  try {
    tester.printRoute(from, to, stdout);
    return true;
  } on ArgumentError catch (e) {
    print('Sorry — ${e.message}');
  } on StateError catch (e) {
    print('Sorry — ${e.message}');
  }
  return false;
}

// Resolve the data file relative to this script so the program runs correctly
// no matter which directory you launch it from.
Subway _loadObjectvilleSubway() {
  final path = Platform.script.resolve('data/ObjectvilleSubway.txt').toFilePath();
  var file = File(path);
  if (!file.existsSync()) {
    // Fallback for when the script URI isn't a file path (e.g. some runners).
    file = File('chapter10/data/ObjectvilleSubway.txt');
  }
  return SubwayLoader().loadFromFile(file);
}
