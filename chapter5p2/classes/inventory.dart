import 'instrument.dart';
import 'instrument_spec.dart';

class Inventory {
  final List<Instrument> _inventory = [];

  void addInstrument(String serialNumber, double price, InstrumentSpec spec) {
    _inventory.add(Instrument(serialNumber, price, spec));
  }

  Instrument? get(String serialNumber) =>
      _inventory.where((i) => i.getSerialNumber() == serialNumber).firstOrNull;

  List<Instrument> search(InstrumentSpec searchSpec) =>
      _inventory.where((i) => i.getSpec().matches(searchSpec)).toList();
}
