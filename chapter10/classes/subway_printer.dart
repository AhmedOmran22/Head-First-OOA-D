import 'connection.dart';

// The Printer module: turns a route into human-readable directions.
//
// Kept separate from Subway (SRP) so output format and destination can change
// without touching how the subway is represented.
class SubwayPrinter {
  final StringSink out;

  SubwayPrinter(this.out);

  void printDirections(List<Connection> route) {
    if (route.isEmpty) {
      out.writeln('You\'re already there!');
      return;
    }

    final first = route.first;
    var previousLine = first.getLineName();

    out.writeln('Start out at ${first.getStation1().getName()}.');
    out.writeln('Get on the $previousLine heading towards '
        '${first.getStation2().getName()}.');

    for (var i = 1; i < route.length; i++) {
      final connection = route[i];
      final currentLine = connection.getLineName();

      if (currentLine == previousLine) {
        out.writeln('Continue past ${connection.getStation1().getName()}...');
      } else {
        out.writeln('When you get to ${connection.getStation1().getName()}, '
            'get off the $previousLine.');
        out.writeln('Switch over to the $currentLine, heading towards '
            '${connection.getStation2().getName()}.');
        previousLine = currentLine;
      }
    }

    out.writeln('Get off at ${route.last.getStation2().getName()} '
        'and enjoy yourself!');
  }
}
