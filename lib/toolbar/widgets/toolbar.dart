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
    const backgroundColor = Color(0XFFF7F7F7);
    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      child: Container(
        width: _kToolbarWidth,
        color: backgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: DesignPanel.values
                    .map((it) => DesignPanelButton(panel: it))
                    .toList(),
              ),
            ),
            ColoredBox(
              color: backgroundColor,
              child: ListView(
                shrinkWrap: true,
                children: DesignTool.values
                    .map((it) => DesignToolbarButton(tool: it))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
