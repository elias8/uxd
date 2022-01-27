import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fxd/toolbar/toolbar.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

void main() {
  group('$DesignPanelContainer', () {
    late ToolbarBloc toolbarBloc;

    setUp(() {
      toolbarBloc = _MockToolbarBloc();
      whenListen(toolbarBloc, Stream.value(ToolbarState.initial));
      when(() => toolbarBloc.state).thenReturn(ToolbarState.initial);
    });

    testWidgets('renders DesignPanelContainer', (tester) async {
      await tester.pumpApp(
        BlocProvider.value(
          value: toolbarBloc,
          child: const Scaffold(
            body: DesignPanelContainer(),
          ),
        ),
      );

      expect(find.byType(DesignPanelContainer), findsOneWidget);
      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.byType(Container), findsNothing);
    });

    testWidgets('should show selected panel', (tester) async {
      when(() => toolbarBloc.state).thenReturn(
        const ToolbarState(
          designTool: DesignTool.text,
          designPanel: DesignPanel.layers,
        ),
      );
      await tester.pumpApp(
        BlocProvider.value(
          value: toolbarBloc,
          child: const Scaffold(
            body: DesignPanelContainer(),
          ),
        ),
      );

      expect(find.byType(DesignPanelContainer), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);
      expect(find.byType(SizedBox), findsNothing);
    });
  });
}

class _MockToolbarBloc extends Mock implements ToolbarBloc {}
