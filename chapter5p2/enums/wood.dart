enum Wood {
  indianRosewood,
  brazilianRosewood,
  mahogany,
  maple,
  sitka,
  alder,
  adirondack,
  afrikaan,
  cherry;

  @override
  String toString() => name[0].toUpperCase() + name.substring(1);
}
