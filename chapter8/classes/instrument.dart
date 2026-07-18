import 'instrument_spec.dart';

// ── Aggregation ──────────────────────────────────────────────────────────────
//
// Instrument uses an InstrumentSpec "as part of" it — but the spec also exists
// on its own (e.g. a customer supplies a search spec with no real instrument).
// The spec is NOT owned/destroyed by the Instrument → that's aggregation
// (open diamond ◇), not composition.
class Instrument {
  final String serialNumber;
  final double price;
  final InstrumentSpec spec; // aggregated — lives independently of Instrument

  Instrument(this.serialNumber, this.price, this.spec);
}
