import 'package:flutter/widgets.dart';

import '../toolbar.dart';

/// {@template design_panel_button}
/// Shows the [panel] button for the libraries and layers panel.
/// {@endtemplate}
class DesignPanelButton extends StatelessWidget {
  /// A [DesignPanel] this widget should build.
  final DesignPanel panel;

  /// {@macro design_panel_button}
  const DesignPanelButton({Key? key, required this.panel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToolbarButton(
      svgIconPath: 'assets/icons/toolbar/${panel.name}.svg',
    );
  }
}
