import 'instrument_spec.dart';

class Instrument {
  final String serialNumber;
  double price;
  final InstrumentSpec spec;

  Instrument(this.serialNumber, this.price, this.spec);

  String getSerialNumber() => serialNumber;
  double getPrice() => price;
  void setPrice(double p) => price = p;
  InstrumentSpec getSpec() => spec;

  @override
  String toString() {
    final type = spec.getProperty('instrumentType') ?? 'Instrument';
    return '$type [#$serialNumber] \$${price.toStringAsFixed(2)}';
  }
}
