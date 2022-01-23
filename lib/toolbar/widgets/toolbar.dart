import 'package:flutter/material.dart';

import '../toolbar.dart';

const _kToolbarWidth = 40.0;

/// {@template toolbar}
/// Shows the selection tool, drawing tools, text tool, art board tool,
/// and layers panel.
/// {@endtemplate}
class Toolbar extends StatelessWidget {
  /// {@macro toolbar}
  const Toolbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.wait,
      child: Container(
        width: _kToolbarWidth,
        color: const Color(0XFFF7F7F7),
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          children: [
            ...DesignTool.values.map((it) => DesignToolbarButton(tool: it)),
            const Spacer(),
            ...DesignPanel.values.map((it) => DesignPanelButton(panel: it)),
          ],
        ),
      ),
    );
  }
}
