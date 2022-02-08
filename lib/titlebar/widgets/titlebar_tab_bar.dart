import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../l10n/l10n.dart';
import '../../models/models.dart';
import '../../toolbar/toolbar.dart';

/// {@template}
/// A tab bar shown to select the [BoardViewType].
/// {@endtemplate}
class TitleBarTab extends StatelessWidget {
  /// {@macro toolbar_tab}
  const TitleBarTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    void onTabSelected(int value) {
      final viewType = BoardViewType.values.elementAt(value);
      final event = ToolbarEvent.boardViewTypeSelected(viewType);
      context.read<ToolbarBloc>().add(event);
    }

    return DefaultTabController(
      length: 2,
      child: TabBar(
        isScrollable: true,
        onTap: onTabSelected,
        tabs: BoardViewType.values
            .map((type) => Tab(text: l10n.boardViewTypeLabel(type.name)))
            .toList(),
      ),
    );
  }
}
