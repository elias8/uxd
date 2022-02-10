import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uxd/board/board.dart';

import '../../helpers/helpers.dart';

void main() {
  group('$BoardZoomInputField', () {
    late BoardBloc boardBloc;

    setUp(() {
      boardBloc = _MockBoardBloc();
      whenListen(boardBloc, Stream.value(BoardState.initial));
      when(() => boardBloc.state).thenReturn(BoardState.initial);
    });

    testWidgets('renders BoardZoomInputField', (tester) async {
      final initialAndHintZoomLevelText = '${BoardZoom.x33.level * 100}%';
      await tester.pumpApp(
        BlocProvider.value(
          value: boardBloc,
          child: const Scaffold(
            body: BoardZoomInputField(),
          ),
        ),
      );

      expect(find.byType(BoardZoomInputField), findsOneWidget);
      expect(find.byType(PopupMenuButton<BoardZoom>), findsOneWidget);
      expect(find.text(initialAndHintZoomLevelText), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);

      await tester.tap(find.byIcon(Icons.expand_more_rounded));
      await tester.pumpAndSettle();

      expect(
        find.byType(PopupMenuItem<BoardZoom>),
        findsNWidgets(BoardZoom.levels.length),
      );
    });

    testWidgets('selecting predefined zoom should add new event to the bloc',
        (tester) async {
      const level = BoardZoom.x50;
      final zoomLevelText = '${(level.level * 100).toInt()}%';

      await tester.pumpApp(
        BlocProvider.value(
          value: boardBloc,
          child: const Scaffold(
            body: BoardZoomInputField(),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.expand_more_rounded));
      await tester.pumpAndSettle();

      await tester
          .tap(find.widgetWithText(PopupMenuItem<BoardZoom>, zoomLevelText));
      verify(() => boardBloc.add(const BoardEvent.zoomChanged(level)))
          .called(1);
    });

    testWidgets(
        'should remove % sign from the input field text when focused '
        'and add it when focused', (tester) async {
      final focusedZoomLevelText = '${BoardZoom.x33.level * 100}';
      final unfocusedZoomLevelText = '$focusedZoomLevelText%';
      await tester.pumpApp(
        BlocProvider.value(
          value: boardBloc,
          child: const Scaffold(
            body: BoardZoomInputField(),
          ),
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
          value: boardBloc,
          child: const Scaffold(
            body: BoardZoomInputField(),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), '58');
      tester.widget<TextField>(find.byType(TextField)).focusNode?.unfocus();
      await tester.pumpAndSettle();

      verify(() => boardBloc.add(const BoardEvent.zoomChanged(BoardZoom(0.58))))
          .called(1);
    });

    testWidgets(
        'should update the text in TextField when a new state is emitted',
        (tester) async {
      const zoom = BoardZoom.x400;
      final zoomLevelText = '${zoom.level * 100}%';
      whenListen(boardBloc, Stream.value(const BoardState(zoom: zoom)));
      await tester.pumpApp(
        BlocProvider.value(
          value: boardBloc,
          child: const Scaffold(body: BoardZoomInputField()),
        ),
      );
      await tester.pump();

      expect(find.widgetWithText(TextField, zoomLevelText), findsOneWidget);
    });
  });
}

class _MockBoardBloc extends Mock implements BoardBloc {}
