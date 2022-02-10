import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uxd/board/board.dart';
import 'package:uxd/models/models.dart';
import 'package:uxd/titlebar/titlebar.dart';

import '../../helpers/helpers.dart';

void main() {
  group('$TitleBarTab', () {
    late BoardBloc boardBloc;

    setUp(() {
      boardBloc = _MockBoardBloc();
      whenListen(boardBloc, Stream.value(BoardState.initial));
    });

    testWidgets('renders TitleBarTab', (tester) async {
      await tester.pumpApp(const Scaffold(body: TitleBarTab()));

      expect(find.byType(Tab), findsNWidgets(BoardViewType.values.length));
    });

    testWidgets('should add a new event when a tab is selected',
        (tester) async {
      await tester.pumpApp(
        BlocProvider.value(
          value: boardBloc,
          child: const Scaffold(body: TitleBarTab()),
        ),
      );

      await tester.tap(find.byType(Tab).last);

      verify(() => boardBloc.add(
              const BoardEvent.boardViewTypeSelected(BoardViewType.prototype)))
          .called(1);
    });
  });
}

class _MockBoardBloc extends Mock implements BoardBloc {}
