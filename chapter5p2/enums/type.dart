enum Type {
  acoustic,
  electric;

  @override
  String toString() => name[0].toUpperCase() + name.substring(1);
}
