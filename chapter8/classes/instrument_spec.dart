// ── OCP: Open-Closed Principle ──────────────────────────────────────────────
//
// InstrumentSpec defines matches() once and CLOSES it for modification — nobody
// edits this method. Subclasses (see guitar_spec.dart) stay OPEN for extension
// by overriding matches() to add their own behavior on top of super.matches().
abstract class InstrumentSpec {
  final Map<String, Object> properties;

  InstrumentSpec(this.properties);

  // CLOSED for modification — this base implementation never changes.
  bool matches(InstrumentSpec other) {
    for (final key in other.properties.keys) {
      if (properties[key] != other.properties[key]) return false;
    }
    return true;
  }
}
