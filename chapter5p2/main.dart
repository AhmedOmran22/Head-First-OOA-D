import 'classes/instrument_spec.dart';
import 'classes/inventory.dart';
import 'enums/builder.dart';
import 'enums/instrument_type.dart';
import 'enums/style.dart';
import 'enums/type.dart';
import 'enums/wood.dart';

void main() {
  final inventory = Inventory();
  _initializeInventory(inventory);
``
  final properties = <String, Object>{
    'builder': Builder.gibson,
    'backWood': Wood.maple,
  };
  final clientSpec = InstrumentSpec(properties);

  final matchingInstruments = inventory.search(clientSpec);

  if (matchingInstruments.isEmpty) {
    print('Sorry, we have nothing for you.');
  } else {
    print('You might like these instruments:');
    for (final instrument in matchingInstruments) {
      final spec = instrument.getSpec();
      final type = spec.getProperty('instrumentType');
      print('\nWe have a $type with the following properties:');
      for (final entry in spec.getProperties().entries) {
        if (entry.key == 'instrumentType') continue;
        print('  ${entry.key}: ${entry.value}');
      }
      print('You can have this $type for \$${instrument.getPrice()}');
      print('---');
    }
  }
}

void _initializeInventory(Inventory inventory) {
  var props = <String, Object>{
    'instrumentType': InstrumentType.guitar,
    'builder': Builder.collings,
    'model': 'CJ',
    'type': Type.acoustic,
    'numStrings': 6,
    'topWood': Wood.sitka,
    'backWood': Wood.indianRosewood,
  };
  inventory.addInstrument('11277', 3999.95, InstrumentSpec(props));

  props = {
    'instrumentType': InstrumentType.guitar,
    'builder': Builder.gibson,
    'model': 'Les Paul',
    'type': Type.electric,
    'numStrings': 6,
    'topWood': Wood.maple,
    'backWood': Wood.maple,
  };
  inventory.addInstrument('70108276', 2295.95, InstrumentSpec(props));

  props = {
    'instrumentType': InstrumentType.mandolin,
    'builder': Builder.gibson,
    'model': 'F-5G',
    'type': Type.acoustic,
    'topWood': Wood.maple,
    'backWood': Wood.maple,
    'style': Style.f,
  };
  inventory.addInstrument('9019920', 5495.99, InstrumentSpec(props));

  props = {
    'instrumentType': InstrumentType.banjo,
    'builder': Builder.gibson,
    'model': 'RB-3 Wreath',
    'type': Type.acoustic,
    'numStrings': 5,
    'backWood': Wood.maple,
  };
  inventory.addInstrument('8900231', 2945.95, InstrumentSpec(props));
}
