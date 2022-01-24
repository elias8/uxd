import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../board/board.dart';
import '../../inspector/inspector.dart';
import '../../toolbar/toolbar.dart';

part 'design_view.dart';

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
