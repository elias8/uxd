import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uxd/toolbar/toolbar.dart';

import '../../helpers/helpers.dart';

void main() {
  group('$Toolbar', () {
    late ToolbarBloc toolbarBloc;

    setUp(() {
      toolbarBloc = _MockToolbarBloc();
      whenListen(toolbarBloc, Stream.value(ToolbarState.initial));
      when(() => toolbarBloc.state).thenReturn(ToolbarState.initial);
    });

    testWidgets('renders Toolbar', (tester) async {
      await tester.pumpApp(
        BlocProvider.value(
          value: toolbarBloc,
          child: const Scaffold(
            body: Toolbar(),
          ),
        ),
      );

      expect(find.byType(Toolbar), findsOneWidget);
      expect(
        find.byType(DesignToolbarButton),
        findsNWidgets(DesignTool.values.length),
      );
      expect(
        find.byType(DesignPanelButton),
        findsNWidgets(DesignPanel.values.length),
      );
    });
  });
}

class _MockToolbarBloc extends Mock implements ToolbarBloc {}
