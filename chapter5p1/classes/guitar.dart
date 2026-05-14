import 'guitar_specs.dart';
import 'instrument.dart';

class Guitar extends Instrument {
  Guitar(String serialNumber, double price, GuitarSpec spec)
      : super(serialNumber, price, spec);
}
