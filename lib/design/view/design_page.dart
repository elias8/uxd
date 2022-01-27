import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../board/board.dart';
import '../../inspector/inspector.dart';
import '../../titlebar/titlebar.dart';
import '../../toolbar/toolbar.dart';

/// {@template design_page}
/// The main page that contains all design widgets.
/// {@endtemplate}
class DesignPage extends StatelessWidget {
  /// {@macro design_page}
  const DesignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => ToolbarBloc())],
      child: const _DesignView(),
    );
  }
}

class _DesignView extends StatelessWidget {
  const _DesignView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TitleBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Row(
                children: const [
                  Toolbar(),
                  DesignPanelContainer(),
                  Expanded(child: DesignBoard()),
                  PropertyInspector(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
