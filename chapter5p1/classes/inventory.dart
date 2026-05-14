import 'guitar.dart';
import 'guitar_specs.dart';
import 'instrument.dart';
import 'instrument_specs.dart';
import 'mandolin.dart';
import 'mandolin_specs.dart';

class Inventory {
  final List<Instrument> _inventory = [];

  void addInstrument(String serialNumber, double price, InstrumentSpec spec) {
    Instrument instrument;
    if (spec is GuitarSpec) {
      instrument = Guitar(serialNumber, price, spec);
    } else if (spec is MandolinSpec) {
      instrument = Mandolin(serialNumber, price, spec);
    } else {
      throw ArgumentError('Unknown InstrumentSpec type');
    }
    _inventory.add(instrument);
  }

  Instrument? get(String serialNumber) {
    return _inventory
        .where((i) => i.getSerialNumber() == serialNumber)
        .firstOrNull;
  }

  List<Guitar> searchGuitars(GuitarSpec searchSpec) {
    return _inventory
        .whereType<Guitar>()
        .where((g) => g.getSpec().matches(searchSpec))
        .toList();
  }

  List<Mandolin> searchMandolins(MandolinSpec searchSpec) {
    return _inventory
        .whereType<Mandolin>()
        .where((m) => m.getSpec().matches(searchSpec))
        .toList();
  }
}
