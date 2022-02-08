import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uxd/models/models.dart';
import 'package:uxd/toolbar/toolbar.dart';

import '../../helpers/helpers.dart';

void main() {
  group('$DesignPanelButton', () {
    late ToolbarBloc toolbarBloc;

    setUp(() {
      toolbarBloc = _MockToolbarBloc();
      whenListen(toolbarBloc, Stream.value(ToolbarState.initial));
      when(() => toolbarBloc.state).thenReturn(ToolbarState.initial);
    });

    testWidgets('renders DesignPanelButton', (tester) async {
      await tester.pumpApp(
        BlocProvider.value(
          value: toolbarBloc,
          child: const Scaffold(
            body: DesignPanelButton(
              panel: DesignPanel.layers,
            ),
          ),
        ),
      );

      expect(find.byType(DesignPanelButton), findsOneWidget);
      expect(
        find.byWidgetPredicate(
            (widget) => widget is ToolbarButton && !widget.isActive),
        findsOneWidget,
      );
    });

    testWidgets('should add a new event when tapped', (tester) async {
      const layersPanelEvent =
          ToolbarEvent.designPanelSelected(DesignPanel.libraries);
      await tester.pumpApp(
        BlocProvider.value(
          value: toolbarBloc,
          child: const Scaffold(
            body: DesignPanelButton(
              panel: DesignPanel.libraries,
            ),
          ),
        ),
      );

      await tester.pump();
      await tester.tap(find.byType(DesignPanelButton));

      verify(() => toolbarBloc.add(layersPanelEvent)).called(1);
    });
  });
}

class _MockToolbarBloc extends Mock implements ToolbarBloc {}
