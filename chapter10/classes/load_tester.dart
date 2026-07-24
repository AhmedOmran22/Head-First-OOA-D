import 'subway.dart';

// Iteration 1's test: proves the subway loaded correctly.
//
// Like SubwayLoader, this client only speaks in Strings — it never touches a
// Station or Connection object.
class LoadTester {
  bool run(Subway subway) {
    print('Testing stations...');
    final stationsPassed = subway.hasStation('DRY Drive') &&
        subway.hasStation('Weather-O-Rama, Inc.') &&
        subway.hasStation("Boards 'R' Us");
    print(stationsPassed
        ? '...station test passed successfully.'
        : '...STATION TEST FAILED.');

    print('\nTesting connections...');
    final connectionsPassed =
        subway.hasConnection('Ajax Rapids', 'HTML Heights', 'Booch Line') &&
            subway.hasConnection(
                'Servlet Springs', 'Objectville Diner', 'Wirfs-Brock Line') &&
            subway.hasConnection(
                'OOA&D Oval', 'CSS Center', 'Meyer Line');
    print(connectionsPassed
        ? '...connections test passed successfully.'
        : '...CONNECTIONS TEST FAILED.');

    // Subways run both ways — the reverse connection must exist too.
    print('\nTesting bidirectional connections...');
    final bidirectionalPassed =
        subway.hasConnection('HTML Heights', 'Ajax Rapids', 'Booch Line');
    print(bidirectionalPassed
        ? '...bidirectional test passed successfully.'
        : '...BIDIRECTIONAL TEST FAILED.');

    return stationsPassed && connectionsPassed && bidirectionalPassed;
  }
}
