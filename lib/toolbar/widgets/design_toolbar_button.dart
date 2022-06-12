import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../board/board.dart';
import '../../l10n/l10n.dart';
import '../../models/models.dart';
import '../toolbar.dart';

/// {@template design_toolbar_button}
/// Shows the selection tool, drawing tools, text tool, art board tool,
/// and layers panel.
/// {@endtemplate}
class DesignToolbarButton extends StatelessWidget {
  /// A [DesignTool] this widget should build.
  final DesignTool tool;

  /// {@macro design_toolbar_button}
  const DesignToolbarButton({super.key, required this.tool});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final currentTool = context.select<BoardBloc, DesignTool>(_selector);
    return ToolbarButton(
      onTap: () =>
          context.read<BoardBloc>().add(BoardEvent.designToolSelected(tool)),
      isActive: tool == currentTool,
      iconPath: 'assets/icons/toolbar/${tool.name}.svg',
      tooltip: l10n.designToolbarButtonTooltip(tool.name),
    );
  }

  DesignTool _selector(BoardBloc bloc) => bloc.state.designTool;
}
