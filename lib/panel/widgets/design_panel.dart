import 'package:flutter/material.dart';

const _kDesignPanelWidth = 196.0;

/// {@template design_panel}
/// A panel that shows layers and libraries.
/// {@endtemplate}
class DesignPanelWidget extends StatelessWidget {
  /// {@macro design_panel}
  const DesignPanelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _kDesignPanelWidth,
      color: const Color(0XFFF7F7F7),
      margin: const EdgeInsets.only(left: 2),
    );
  }
}
