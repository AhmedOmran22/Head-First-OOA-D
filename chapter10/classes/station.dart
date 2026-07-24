// A named point on the subway map. Simple and focused (SRP).
//
// The key design insight: == and hashCode are overridden so two Station objects
// with the same name are EQUAL, regardless of whether they're the same object in
// memory. Without this, `stations.contains(Station('Ajax Rapids'))` would compare
// identity and always fail. Override them together — objects that are equal must
// share a hash code, or hash-based collections break in subtle ways.
class Station {
  final String name;

  Station(this.name);

  String getName() => name;

  @override
  bool operator ==(Object other) =>
      other is Station && other.name.toLowerCase() == name.toLowerCase();

  @override
  int get hashCode => name.toLowerCase().hashCode;

  @override
  String toString() => name;
}
