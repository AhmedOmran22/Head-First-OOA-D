import 'station.dart';

// Links two stations on a specific subway line. Immutable once created.
//
// Note there's no Line class: a line is only ever queried as a label on a
// connection, so a String name is enough. That's a design decision driven by how
// the system is USED — adding a Line class would add complexity without value.
class Connection {
  final Station station1;
  final Station station2;
  final String lineName;

  Connection(this.station1, this.station2, this.lineName);

  Station getStation1() => station1;

  Station getStation2() => station2;

  String getLineName() => lineName;

  @override
  bool operator ==(Object other) =>
      other is Connection &&
      other.station1 == station1 &&
      other.station2 == station2 &&
      other.lineName.toLowerCase() == lineName.toLowerCase();

  @override
  int get hashCode =>
      Object.hash(station1, station2, lineName.toLowerCase());

  @override
  String toString() => '$station1 -> $station2 ($lineName)';
}
