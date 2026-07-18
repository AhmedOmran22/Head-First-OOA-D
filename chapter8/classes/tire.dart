// A simple part used by Automobile and swapped by Mechanic (see SRP demo).
class Tire {
  final String brand;

  Tire([this.brand = 'generic']);

  @override
  String toString() => '$brand tire';
}
