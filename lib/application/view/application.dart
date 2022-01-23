import 'package:flutter/material.dart';

/// {@template application}
/// An entry widget to the application.
/// {@endtemplate}
class Application extends StatelessWidget {
  /// {@macro application}
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FXD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
