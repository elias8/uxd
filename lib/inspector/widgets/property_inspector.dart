import 'package:flutter/material.dart';

const _kPropertyInspectorWidth = 232.0;

/// {@template property_inspector}
/// Show a property inspector for a selected design in the design board.
/// {@endtemplate}
class PropertyInspector extends StatelessWidget {
  /// {@macro property_inspector}
  const PropertyInspector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0XFFF7F7F7),
      width: _kPropertyInspectorWidth,
    );
  }
}
