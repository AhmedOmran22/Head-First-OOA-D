import 'instrument_spec.dart';

// ── OCP: OPEN for extension ──────────────────────────────────────────────────
//
// GuitarSpec extends InstrumentSpec and overrides matches() to add guitar-
// specific logic — without ever touching InstrumentSpec.matches().
class GuitarSpec extends InstrumentSpec {
  final int numStrings;

  GuitarSpec(super.properties, this.numStrings);

  @override
  bool matches(InstrumentSpec other) {
    if (!super.matches(other)) return false;
    if (other is GuitarSpec) {
      return numStrings == other.numStrings;
    }
    return false;
  }
}
