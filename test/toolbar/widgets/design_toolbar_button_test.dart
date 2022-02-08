import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uxd/toolbar/toolbar.dart';

import '../../helpers/helpers.dart';

void main() {
  group('$DesignToolbarButton', () {
    late ToolbarBloc toolbarBloc;

    setUp(() {
      toolbarBloc = _MockToolbarBloc();
      whenListen(toolbarBloc, Stream.value(ToolbarState.initial));
      when(() => toolbarBloc.state).thenReturn(ToolbarState.initial);
    });

    testWidgets('renders DesignToolbarButton', (tester) async {
      await tester.pumpApp(
        BlocProvider.value(
          value: toolbarBloc,
          child: const Scaffold(
            body: DesignToolbarButton(
              tool: DesignTool.selector,
            ),
          ),
        ),
      );

      expect(find.byType(DesignToolbarButton), findsOneWidget);
      expect(
        find.byWidgetPredicate(
            (widget) => widget is ToolbarButton && widget.isActive),
        findsOneWidget,
      );
    });

    testWidgets('should add a new event when tapped', (tester) async {
      const textToolEvent = ToolbarEvent.designToolSelected(DesignTool.text);
      await tester.pumpApp(
        BlocProvider.value(
          value: toolbarBloc,
          child: const Scaffold(
            body: DesignToolbarButton(
              tool: DesignTool.text,
            ),
          ),
        ),
      );

      await tester.pump();
      await tester.tap(find.byType(DesignToolbarButton));

      verify(() => toolbarBloc.add(textToolEvent)).called(1);
    });
  });
}

class _MockToolbarBloc extends Mock implements ToolbarBloc {}
