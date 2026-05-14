import '../enums/builder.dart';
import '../enums/type.dart';
import '../enums/wood.dart';

abstract class InstrumentSpec {
  final Builder builder;
  final String? model;
  final Type type;
  final Wood backWood;
  final Wood topWood;

  const InstrumentSpec(
      this.builder, this.model, this.type, this.backWood, this.topWood);

  Builder getBuilder() => builder;
  String? getModel() => model;
  Type getType() => type;
  Wood getBackWood() => backWood;
  Wood getTopWood() => topWood;

  bool matches(InstrumentSpec other) {
    if (builder != other.builder) return false;
    if (model != null &&
        model!.isNotEmpty &&
        model!.toLowerCase() != other.model?.toLowerCase()) return false;
    if (type != other.type) return false;
    if (backWood != other.backWood) return false;
    if (topWood != other.topWood) return false;
    return true;
  }
}
