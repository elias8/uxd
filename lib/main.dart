import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

import 'application/application.dart';

void main() {
  runApp(const Application());
  setDesktopInitialConfiguration();
}

/// Sets the initial desktop configuration setup.
void setDesktopInitialConfiguration() {
  doWhenWindowReady(() {
    appWindow.minSize = const Size(640, 560);
    appWindow.show();
  });
}
