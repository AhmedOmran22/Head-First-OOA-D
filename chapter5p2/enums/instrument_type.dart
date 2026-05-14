enum InstrumentType {
  guitar,
  banjo,
  dobro,
  fiddle,
  bass,
  mandolin;

  @override
  String toString() => name[0].toUpperCase() + name.substring(1);
}
