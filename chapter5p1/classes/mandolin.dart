import 'instrument.dart';
import 'mandolin_specs.dart';

class Mandolin extends Instrument {
  Mandolin(String serialNumber, double price, MandolinSpec spec)
      : super(serialNumber, price, spec);
}
