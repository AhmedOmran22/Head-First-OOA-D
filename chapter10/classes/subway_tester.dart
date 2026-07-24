import 'subway.dart';
import 'subway_printer.dart';

// Iteration 2's test: proves we can get directions between two stations and
// print them as usable instructions. This is what you show the customer.
class SubwayTester {
  final Subway subway;

  SubwayTester(this.subway);

  void printRoute(String from, String to, StringSink out) {
    final route = subway.getDirections(from, to);
    SubwayPrinter(out).printDirections(route);
  }
}
