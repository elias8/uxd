import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../board/board.dart';
import '../../models/models.dart';

const _kDesignPanelWidth = 196.0;

/// {@template design_panel_container}
/// A panel that shows layers and libraries.
/// {@endtemplate}
class DesignPanelContainer extends StatelessWidget {
  /// {@macro design_panel_container}
  const DesignPanelContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final currentPanel = context.select<BoardBloc, DesignPanel?>(_selector);
    if (currentPanel == null) return const SizedBox();
    return Container(
      width: _kDesignPanelWidth,
      color: const Color(0XFFF7F7F7),
      margin: const EdgeInsets.only(left: 2),
    );
  }

  DesignPanel? _selector(BoardBloc bloc) => bloc.state.designPanel;
}
