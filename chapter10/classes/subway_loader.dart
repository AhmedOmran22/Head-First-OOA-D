import 'dart:io';

import 'subway.dart';

// The Loader module: builds a Subway from a text file.
//
// SRP — loading is completely separate from representing the subway. Notice this
// class only ever passes Strings to Subway; it never creates a Station or
// Connection itself, so it stays decoupled from those classes.
//
// File format:
//   every station name, one per line
//   (blank line)
//   line name, then its stations in order
//   (blank line)
//   ...repeated for each line
class SubwayLoader {
  Subway loadFromFile(File file) {
    final subway = Subway();
    final lines = file.readAsLinesSync().map((l) => l.trim()).toList();

    var i = 0;

    // First block: all the station names.
    while (i < lines.length && lines[i].isNotEmpty) {
      subway.addStation(lines[i]);
      i++;
    }

    // Remaining blocks: one subway line each.
    while (i < lines.length) {
      if (lines[i].isEmpty) {
        i++;
        continue;
      }

      final lineName = lines[i];
      i++;

      String? previousStation;
      while (i < lines.length && lines[i].isNotEmpty) {
        final station = lines[i];
        if (previousStation != null) {
          subway.addConnection(previousStation, station, lineName);
        }
        previousStation = station;
        i++;
      }
    }

    return subway;
  }
}
