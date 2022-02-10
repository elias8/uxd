import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../board/board.dart';
import '../../models/models.dart';
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
    final currentPanel = context.select<BoardBloc, DesignPanel?>(_selector);
    return ToolbarButton(
      onTap: () =>
          context.read<BoardBloc>().add(BoardEvent.designPanelSelected(panel)),
      isActive: panel == currentPanel,
      iconPath: 'assets/icons/toolbar/${panel.name}.svg',
    );
  }

  DesignPanel? _selector(BoardBloc bloc) => bloc.state.designPanel;
}
