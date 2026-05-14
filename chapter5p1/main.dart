import 'classes/guitar_specs.dart';
import 'classes/inventory.dart';
import 'classes/mandolin_specs.dart';
import 'enums/builder.dart';
import 'enums/style.dart';
import 'enums/type.dart';
import 'enums/wood.dart';

void main() {
  final inventory = Inventory();

  inventory.addInstrument(
      '11277',
      3999.95,
      GuitarSpec(
          Builder.collings, 'CJ', Type.acoustic, Wood.indianRosewood, Wood.sitka, 6));

  inventory.addInstrument(
      'V95693',
      1499.95,
      GuitarSpec(
          Builder.fender, 'Stratocastor', Type.electric, Wood.alder, Wood.alder, 6));

  inventory.addInstrument(
      '9019920',
      5495.99,
      MandolinSpec(
          Builder.gibson, 'F-5G', Type.acoustic, Wood.maple, Wood.maple, Style.f));

  print('=== Searching for Gibson electric guitars ===');
  final guitarSearch =
      GuitarSpec(Builder.gibson, null, Type.electric, Wood.maple, Wood.maple, 6);
  final guitars = inventory.searchGuitars(guitarSearch);
  if (guitars.isEmpty) {
    print('No matching guitars found.');
  } else {
    for (final g in guitars) print('  Found: $g');
  }

  print('\n=== Searching for acoustic mandolins ===');
  final mandolinSearch =
      MandolinSpec(Builder.gibson, null, Type.acoustic, Wood.maple, Wood.maple, Style.f);
  final mandolins = inventory.searchMandolins(mandolinSearch);
  if (mandolins.isEmpty) {
    print('No matching mandolins found.');
  } else {
    for (final m in mandolins) print('  Found: $m');
  }
}
