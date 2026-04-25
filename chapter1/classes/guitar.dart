import 'guitar_specs.dart';

class Guitar {
  String _serialNumber;
  double _price;
  GuitarSpecs _specs;

  set serialNumber(String serialNumber) => _serialNumber = serialNumber;
  set price(double price) => _price = price;
  set specs(GuitarSpecs specs) => _specs = specs;

  String get serialNumber => _serialNumber;
  double get price => _price;
  GuitarSpecs get specs => _specs;

  Guitar({
    required String serialNumber,
    required double price,
    required GuitarSpecs specs,
  }) : _serialNumber = serialNumber,
       _price = price,
       _specs = specs;
}
