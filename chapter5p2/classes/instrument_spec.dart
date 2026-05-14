class InstrumentSpec {
  final Map<String, Object> _properties;

  InstrumentSpec(Map<String, Object>? properties)
      : _properties =
            properties != null ? Map<String, Object>.from(properties) : {};

  Object? getProperty(String propertyName) => _properties[propertyName];

  Map<String, Object> getProperties() => Map.unmodifiable(_properties);

  bool matches(InstrumentSpec otherSpec) {
    for (final entry in otherSpec._properties.entries) {
      if (_properties[entry.key] != entry.value) return false;
    }
    return true;
  }
}
