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
      if (guitar.specs.builder == searchGuitarSpecs.builder &&
          guitar.specs.model == searchGuitarSpecs.model &&
          guitar.specs.type == searchGuitarSpecs.type &&
          guitar.specs.backWood == searchGuitarSpecs.backWood &&
          guitar.specs.topWood == searchGuitarSpecs.topWood) {
        matchingGuitars.add(guitar);
      }
    }
    return matchingGuitars;
  }
}
