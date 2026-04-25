enum Wood {
  alder,
  mahogany,
  nato,
  spruce,
  maple,
  basswood;

  String toString() {
    switch (this) {
      case Wood.alder:
        return 'Alder';
      case Wood.spruce:
        return 'Spruce';
      case Wood.maple:
        return 'Maple';
      case Wood.mahogany:
        return 'Mahogany';
      case Wood.nato:
        return 'Nato';
      case Wood.basswood:
        return 'Basswood';
    }
  }
}
