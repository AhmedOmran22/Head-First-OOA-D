import '../enums/builder.dart';
import '../enums/type.dart';
import '../enums/wood.dart';
import 'instrument_specs.dart';

class GuitarSpec extends InstrumentSpec {
  final int numStrings;

  const GuitarSpec(Builder builder, String? model, Type type, Wood backWood,
      Wood topWood, this.numStrings)
      : super(builder, model, type, backWood, topWood);

  int getNumStrings() => numStrings;

  @override
  bool matches(InstrumentSpec other) {
    if (!super.matches(other)) return false;
    if (other is! GuitarSpec) return false;
    return numStrings == other.numStrings;
  }
}
