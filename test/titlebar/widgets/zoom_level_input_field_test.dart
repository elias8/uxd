import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uxd/titlebar/titlebar.dart';
import 'package:uxd/toolbar/toolbar.dart';

import '../../helpers/helpers.dart';

void main() {
  group('$ZoomLevelInputField', () {
    late ToolbarBloc toolbarBloc;

    setUp(() {
      toolbarBloc = _MockToolbarBloc();
      whenListen(toolbarBloc, Stream.value(ToolbarState.initial));
      when(() => toolbarBloc.state).thenReturn(ToolbarState.initial);
    });

    testWidgets('renders ZoomLevelInputField', (tester) async {
      final initialAndHintZoomLevelText = '${ZoomLevel.x33.level * 100}%';
      await tester.pumpApp(
        BlocProvider.value(
          value: toolbarBloc,
          child: const Scaffold(body: ZoomLevelInputField()),
        ),
      );

      expect(find.byType(ZoomLevelInputField), findsOneWidget);
      expect(find.byType(PopupMenuButton<ZoomLevel>), findsOneWidget);
      expect(find.text(initialAndHintZoomLevelText), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);

      await tester.tap(find.byIcon(Icons.expand_more_rounded));
      await tester.pumpAndSettle();

      expect(
        find.byType(PopupMenuItem<ZoomLevel>),
        findsNWidgets(ZoomLevel.levels.length),
      );
    });

    testWidgets('selecting predefined zoom should add new event to the bloc',
        (tester) async {
      const level = ZoomLevel.x50;
      final zoomLevelText = '${(level.level * 100).toInt()}%';

      await tester.pumpApp(
        BlocProvider.value(
          value: toolbarBloc,
          child: const Scaffold(body: ZoomLevelInputField()),
        ),
      );

      await tester.tap(find.byIcon(Icons.expand_more_rounded));
      await tester.pumpAndSettle();

      await tester
          .tap(find.widgetWithText(PopupMenuItem<ZoomLevel>, zoomLevelText));
      verify(() => toolbarBloc.add(const ToolbarEvent.zoomLevelUpdated(level)))
          .called(1);
    });

    testWidgets(
        'should remove % sign from the input field text when focused '
        'and add it when focused', (tester) async {
      final focusedZoomLevelText = '${ZoomLevel.x33.level * 100}';
      final unfocusedZoomLevelText = '$focusedZoomLevelText%';
      await tester.pumpApp(
        BlocProvider.value(
          value: toolbarBloc,
          child: const Scaffold(body: ZoomLevelInputField()),
        ),
      );

      expect(find.text(focusedZoomLevelText), findsNothing);
      expect(find.text(unfocusedZoomLevelText), findsOneWidget);

      await tester.tap(find.byType(TextField));
      expect(find.text(focusedZoomLevelText), findsOneWidget);
      expect(find.text(unfocusedZoomLevelText), findsNothing);

      tester.widget<TextField>(find.byType(TextField)).focusNode?.unfocus();
      await tester.pumpAndSettle();
      expect(find.text(focusedZoomLevelText), findsNothing);
      expect(find.text(unfocusedZoomLevelText), findsOneWidget);
    });

    testWidgets(
        'should add a new event with changed zoom level when focus is removed',
        (tester) async {
      await tester.pumpApp(
        BlocProvider.value(
          value: toolbarBloc,
          child: const Scaffold(body: ZoomLevelInputField()),
        ),
      );

      await tester.enterText(find.byType(TextField), '58');
      tester.widget<TextField>(find.byType(TextField)).focusNode?.unfocus();
      await tester.pumpAndSettle();

      verify(() => toolbarBloc
          .add(const ToolbarEvent.zoomLevelUpdated(ZoomLevel(0.58)))).called(1);
    });

    testWidgets(
        'should update the text in TextField when a new state is emitted',
        (tester) async {
      const level = ZoomLevel.x400;
      final zoomLevelText = '${level.level * 100}%';
      whenListen(
        toolbarBloc,
        Stream.value(const ToolbarState(zoomLevel: level)),
      );
      await tester.pumpApp(
        BlocProvider.value(
          value: toolbarBloc,
          child: const Scaffold(body: ZoomLevelInputField()),
        ),
      );
      await tester.pump();

      expect(find.widgetWithText(TextField, zoomLevelText), findsOneWidget);
    });
  });
}

class _MockToolbarBloc extends Mock implements ToolbarBloc {}
