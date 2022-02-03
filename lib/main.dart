import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'application/application.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const Application()),
    blocObserver: AppBlocObserver(),
  );
  setDesktopInitialConfiguration();
}

/// Sets the initial desktop configuration setup.
void setDesktopInitialConfiguration() {
  doWhenWindowReady(() {
    appWindow.minSize = const Size(640, 560);
    appWindow.show();
  });
}
