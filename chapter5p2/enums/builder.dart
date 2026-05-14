enum Builder {
  collings,
  martin,
  gibson,
  fender,
  epiphoneone;

  @override
  String toString() => name[0].toUpperCase() + name.substring(1);
}
