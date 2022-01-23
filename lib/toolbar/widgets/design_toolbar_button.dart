import 'package:flutter/widgets.dart';

import '../toolbar.dart';

/// {@template design_toolbar_button}
/// Shows the selection tool, drawing tools, text tool, art board tool,
/// and layers panel.
/// {@endtemplate}
class DesignToolbarButton extends StatelessWidget {
  /// A [DesignTool] this widget should build.
  final DesignTool tool;

  /// {@macro design_toolbar_button}
  const DesignToolbarButton({Key? key, required this.tool}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToolbarButton(
      svgIconPath: 'assets/icons/toolbar/${tool.name}.svg',
    );
  }
}
