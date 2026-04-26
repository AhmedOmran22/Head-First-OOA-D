import 'enums/builder.dart';
import 'enums/type.dart';
import 'enums/wood.dart';
import 'classes/guitar.dart';
import 'classes/guitar_specs.dart';
import 'classes/inventory.dart';

void main() {
  final List<Guitar> guitars = [
    Guitar(
      serialNumber: 'SN001',
      price: 1500.0,

      specs: GuitarSpecs(
        numberOfStrings: 12,
        builder: Builder.fender,
        model: 'Stratocaster',
        guitarType: GuitarType.electric,
        backWood: Wood.alder,
        topWood: Wood.alder,
      ),
    ),
    Guitar(
      serialNumber: 'SN002',
      price: 1800.0,
      specs: GuitarSpecs(
        numberOfStrings: 12,
        builder: Builder.gibson,
        model: 'Les Paul',
        guitarType: GuitarType.electric,
        backWood: Wood.mahogany,
        topWood: Wood.maple,
      ),
    ),
    Guitar(
      serialNumber: 'SN003',
      price: 1200.0,
      specs: GuitarSpecs(
        numberOfStrings: 12,
        builder: Builder.yamaha,
        model: 'FG800',
        guitarType: GuitarType.acoustic,
        backWood: Wood.nato,
        topWood: Wood.spruce,
      ),
    ),
    Guitar(
      serialNumber: 'SN004',
      price: 2200.0,
      specs: GuitarSpecs(
        numberOfStrings: 12,
        builder: Builder.prs,
        model: 'Custom 24',
        guitarType: GuitarType.electric,
        backWood: Wood.mahogany,
        topWood: Wood.maple,
      ),
    ),
    Guitar(
      serialNumber: 'SN005',
      price: 900.0,
      specs: GuitarSpecs(
        numberOfStrings: 12,
        builder: Builder.fender,
        model: 'Stratocaster',
        guitarType: GuitarType.electric,
        backWood: Wood.alder,
        topWood: Wood.alder,
      ),
    ),
  ];

  Inventory inventory = Inventory(guitars: guitars);
  GuitarSpecs whatErinsLike = GuitarSpecs(
    numberOfStrings: 12,
    builder: Builder.fender,
    model: 'Stratocaster',
    guitarType: GuitarType.electric,
    backWood: Wood.alder,
    topWood: Wood.alder,
  );
  List<Guitar> matchingGuitars = inventory.search(whatErinsLike);
  if (matchingGuitars.isEmpty) {
    print('Guitar not found');
  } else {
    for (Guitar g in matchingGuitars) {
      print(
        'Erin you may Like this ${g.specs.builder} ${g.specs.model} ${g.specs.type} ${g.specs.backWood} ${g.specs.topWood} ${g.price}',
      );
    }
  }
}
