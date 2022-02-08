import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/models.dart';
import '../../toolbar/toolbar.dart';

const _kDesignPanelWidth = 196.0;

/// {@template design_panel_container}
/// A panel that shows layers and libraries.
/// {@endtemplate}
class DesignPanelContainer extends StatelessWidget {
  /// {@macro design_panel_container}
  const DesignPanelContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentPanel = context.select<ToolbarBloc, DesignPanel?>(_selector);
    if (currentPanel == null) return const SizedBox();
    return Container(
      width: _kDesignPanelWidth,
      color: const Color(0XFFF7F7F7),
      margin: const EdgeInsets.only(left: 2),
    );
  }

  DesignPanel? _selector(ToolbarBloc bloc) => bloc.state.designPanel;
}
