// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart' as fdriver;
import 'package:test/test.dart' as ftest;

void main() {
  ftest.group('Counter App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final counterTextFinder = fdriver.find.byValueKey('counter');
    final buttonFinder = fdriver.find.byValueKey('increment');

    fdriver.FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    ftest.setUpAll(() async {
      driver = await fdriver.FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    ftest.tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    ftest.test('starts at 0', () async {
      // Use the `driver.getText` method to verify the counter starts at 0.
      ftest.expect(await driver.getText(counterTextFinder), "0");
    });

    ftest.test('increments the counter', () async {
      // First, tap the button.
      await driver.tap(buttonFinder);

      // Then, verify the counter text is incremented by 1.
      ftest.expect(await driver.getText(counterTextFinder), "1");
    });
  });
}

