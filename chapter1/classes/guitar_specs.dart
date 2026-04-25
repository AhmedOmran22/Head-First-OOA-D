import '../enums/builder.dart';
import '../enums/type.dart';
import '../enums/wood.dart';

class GuitarSpecs {
  Builder _builder;
  Wood _backWood;
  Wood _topWood;
  GuitarType _guitarType;
  String _model;

  GuitarSpecs({
    required Builder builder,
    required Wood backWood,
    required Wood topWood,
    required GuitarType guitarType,
    required String model,
  }) : _builder = builder,
       _backWood = backWood,
       _topWood = topWood,
       _guitarType = guitarType,
       _model = model;

  set builder(Builder builder) => _builder = builder;
  set model(String model) => _model = model;
  set type(GuitarType _guitarType) => _guitarType = type;
  set backWood(Wood backWood) => _backWood = backWood;
  set topWood(Wood topWood) => _topWood = topWood;

  Builder get builder => _builder;
  String get model => _model;
  GuitarType get type => _guitarType;
  Wood get backWood => _backWood;
  Wood get topWood => _topWood;
}
