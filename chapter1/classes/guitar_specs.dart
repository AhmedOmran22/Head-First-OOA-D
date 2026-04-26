import '../enums/builder.dart';
import '../enums/type.dart';
import '../enums/wood.dart';

class GuitarSpecs {
  Builder _builder;
  Wood _backWood;
  Wood _topWood;
  GuitarType _guitarType;
  String _model;
  int _numberOfStrings;

  GuitarSpecs({
    required Builder builder,
    required Wood backWood,
    required Wood topWood,
    required GuitarType guitarType,
    required String model,
    required int numberOfStrings,
  }) : _builder = builder,
       _backWood = backWood,
       _topWood = topWood,
       _guitarType = guitarType,
       _model = model,
       _numberOfStrings = numberOfStrings;

  set builder(Builder builder) => _builder = builder;
  set model(String model) => _model = model;
  set type(GuitarType _guitarType) => _guitarType = type;
  set backWood(Wood backWood) => _backWood = backWood;
  set topWood(Wood topWood) => _topWood = topWood;
  set numberOfStrings(int numberOfStrings) => _numberOfStrings = numberOfStrings;

  Builder get builder => _builder;
  String get model => _model;
  GuitarType get type => _guitarType;
  Wood get backWood => _backWood;
  Wood get topWood => _topWood;
  int get numberOfStrings => _numberOfStrings;

  bool matches(GuitarSpecs otherSpec) {
    if (builder != otherSpec.builder) return false;
    if (otherSpec.model.isNotEmpty &&
        otherSpec.model.toLowerCase() != model.toLowerCase()) return false;
    if (type != otherSpec.type) return false;
    if (backWood != otherSpec.backWood) return false;
    if (topWood != otherSpec.topWood) return false;
    if (numberOfStrings != otherSpec.numberOfStrings) return false;
    return true;
  }
}
