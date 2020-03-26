import 'package:flutter_driver/driver_extension.dart' as fdriver;
import 'package:counterapp/main.dart' as app;

void main() {
  // This line enables the extension.
  fdriver.enableFlutterDriverExtension();

  // Call the `main()` function of the app, or call `runApp` with
  // any widget you are interested in testing.
  app.main();
}
