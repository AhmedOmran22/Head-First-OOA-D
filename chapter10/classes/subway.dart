import 'connection.dart';
import 'station.dart';

// The core class of the Subway module.
//
// PROTECTING CLIENTS: every public method takes and returns Strings for station
// and line names. Station and Connection objects are created internally, so
// client code (SubwayLoader, the testers) never has to know those classes exist.
// Change how Station works and no client breaks.
class Subway {
  final List<Station> stations = [];
  final List<Connection> connections = [];

  // Adjacency map: each station -> the stations directly reachable from it.
  // This is what makes route-finding efficient.
  final Map<Station, List<Station>> network = {};

  void addStation(String stationName) {
    if (!hasStation(stationName)) {
      stations.add(Station(stationName));
    }
  }

  bool hasStation(String stationName) =>
      stations.contains(Station(stationName)); // relies on Station.==

  // Subways run both ways, so adding A->B also adds B->A.
  void addConnection(String station1Name, String station2Name, String lineName) {
    if (!hasStation(station1Name) || !hasStation(station2Name)) {
      throw ArgumentError(
          'Both stations must exist before connecting them: '
          '"$station1Name", "$station2Name"');
    }
    final s1 = Station(station1Name);
    final s2 = Station(station2Name);

    _connect(s1, s2, lineName);
    _connect(s2, s1, lineName);
  }

  void _connect(Station from, Station to, String lineName) {
    final connection = Connection(from, to, lineName);
    if (!connections.contains(connection)) {
      connections.add(connection);
    }
    final neighbors = network.putIfAbsent(from, () => []);
    if (!neighbors.contains(to)) neighbors.add(to);
  }

  bool hasConnection(String station1Name, String station2Name, String lineName) =>
      connections
          .contains(Connection(Station(station1Name), Station(station2Name), lineName));

  // ── getDirections: shortest path between two stations ──────────────────────
  //
  // Finding the shortest path through a graph is a classic, long-solved problem
  // — Dijkstra's algorithm. No reason to invent something new here. Every hop
  // costs the same (one stop), so the frontier is explored in distance order and
  // `previousStations` lets us walk the route back once we reach the end.
  List<Connection> getDirections(String startName, String endName) {
    if (!hasStation(startName) || !hasStation(endName)) {
      throw ArgumentError('Stations do not exist on this subway.');
    }

    final start = Station(startName);
    final end = Station(endName);

    final distances = <Station, int>{start: 0};
    final previousStations = <Station, Station>{};
    final unvisited = <Station>[start];
    final visited = <Station>{};

    while (unvisited.isNotEmpty) {
      // Pick the unvisited station with the smallest known distance.
      unvisited.sort((a, b) =>
          (distances[a] ?? 1 << 30).compareTo(distances[b] ?? 1 << 30));
      final current = unvisited.removeAt(0);

      if (current == end) break;
      if (!visited.add(current)) continue;

      final distance = distances[current]!;
      for (final neighbor in network[current] ?? const <Station>[]) {
        if (visited.contains(neighbor)) continue;
        final candidate = distance + 1;
        if (candidate < (distances[neighbor] ?? 1 << 30)) {
          distances[neighbor] = candidate;
          previousStations[neighbor] = current;
          if (!unvisited.contains(neighbor)) unvisited.add(neighbor);
        }
      }
    }

    if (start != end && !previousStations.containsKey(end)) {
      throw StateError('No route from "$startName" to "$endName".');
    }

    // Walk backwards from the end to rebuild the ordered list of stations.
    final path = <Station>[end];
    var step = end;
    while (step != start) {
      step = previousStations[step]!;
      path.insert(0, step);
    }

    // Turn each pair of adjacent stations into the Connection that links them,
    // so the caller learns which line to ride for every hop.
    final route = <Connection>[];
    for (var i = 0; i < path.length - 1; i++) {
      route.add(_findConnection(path[i], path[i + 1]));
    }
    return route;
  }

  Connection _findConnection(Station from, Station to) => connections.firstWhere(
      (c) => c.getStation1() == from && c.getStation2() == to);
}
