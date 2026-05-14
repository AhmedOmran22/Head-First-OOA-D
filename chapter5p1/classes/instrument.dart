import 'instrument_specs.dart';

abstract class Instrument {
  final String serialNumber;
  double price;
  final InstrumentSpec spec;

  Instrument(this.serialNumber, this.price, this.spec);

  String getSerialNumber() => serialNumber;
  double getPrice() => price;
  void setPrice(double p) => price = p;
  InstrumentSpec getSpec() => spec;

  @override
  String toString() =>
      '${spec.runtimeType.toString().replaceAll("Spec", "")} '
      '[#$serialNumber] \$${price.toStringAsFixed(2)}';
}
