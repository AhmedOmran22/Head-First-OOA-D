class Unit {
  final String _unitType;
  final Map<String, Object> _properties = {};

  Unit(this._unitType);

  String getType() => _unitType;

  void setProperty(String propertyName, Object propertyValue) {
    _properties[propertyName] = propertyValue;
  }

  Object? getProperty(String propertyName) => _properties[propertyName];

  Map<String, Object> getProperties() => Map.unmodifiable(_properties);

  @override
  String toString() => '$_unitType $_properties';
}
