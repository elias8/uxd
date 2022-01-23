import 'package:flutter/material.dart';

import '../../board/board.dart';
import '../../inspector/inspector.dart';
import '../../panel/panel.dart';
import '../../toolbar/toolbar.dart';

/// {@template design_page}
/// The main page that contains all design widgets.
/// {@endtemplate}
class DesignPage extends StatelessWidget {
  /// {@macro design_page}
  const DesignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [
          Toolbar(),
          DesignPanelWidget(),
          Expanded(child: DesignBoard()),
          PropertyInspector(),
        ],
      ),
    );
  }
}
