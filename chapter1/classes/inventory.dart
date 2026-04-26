import '../enums/builder.dart';
import '../enums/type.dart';
import '../enums/wood.dart';
import 'guitar.dart';
import 'guitar_specs.dart';

class Inventory {
  List<Guitar> _guitars;
  Inventory({required List<Guitar> guitars}) : _guitars = guitars;

  List<Guitar> get guitars => _guitars;

  void addGuitar({
    required String serialNumber,
    required double price,
    required Builder builder,
    required String model,
    required GuitarType type,
    required Wood backWood,
    required Wood topWood,
    required int numberOfStrings,
  }) {
    _guitars.add(
      Guitar(
        serialNumber: serialNumber,
        price: price,
        specs: GuitarSpecs(
          builder: builder,
          model: model,
          guitarType: type,
          backWood: backWood,
          topWood: topWood,
          numberOfStrings: numberOfStrings,
        ),
      ),
    );
  }

  Guitar? getGuitar(String serialNumber) {
    for (var guitar in _guitars) {
      if (guitar.serialNumber == serialNumber) {
        return guitar;
      }
    }
    return null;
  }

  List<Guitar> search(GuitarSpecs searchGuitarSpecs) {
    List<Guitar> matchingGuitars = [];
    for (Guitar guitar in _guitars) {
      if (guitar.specs.matches(searchGuitarSpecs)) {
        matchingGuitars.add(guitar);
      }
    }
    return matchingGuitars;
  }
}
