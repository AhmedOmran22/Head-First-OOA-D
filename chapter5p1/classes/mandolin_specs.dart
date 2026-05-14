import '../enums/builder.dart';
import '../enums/style.dart';
import '../enums/type.dart';
import '../enums/wood.dart';
import 'instrument_specs.dart';

class MandolinSpec extends InstrumentSpec {
  final Style style;

  const MandolinSpec(Builder builder, String? model, Type type, Wood backWood,
      Wood topWood, this.style)
      : super(builder, model, type, backWood, topWood);

  Style getStyle() => style;

  @override
  bool matches(InstrumentSpec other) {
    if (!super.matches(other)) return false;
    if (other is! MandolinSpec) return false;
    return style == other.style;
  }
}
