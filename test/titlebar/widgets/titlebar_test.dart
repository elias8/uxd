import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uxd/board/board.dart';
import 'package:uxd/titlebar/titlebar.dart';

import '../../helpers/widget_tester_extension.dart';

void main() {
  group('$TitleBar', () {
    late BoardBloc boardBloc;

    setUp(() {
      boardBloc = _MockBoardBloc();
      whenListen(boardBloc, Stream.value(BoardState.initial));
      when(() => boardBloc.state).thenReturn(BoardState.initial);
    });

    testWidgets('renders TitleBar', (tester) async {
      await tester.pumpApp(
        BlocProvider.value(
          value: boardBloc,
          child: const Scaffold(body: TitleBar()),
        ),
      );

      expect(find.byType(TitleBar), findsOneWidget);
      expect(find.byType(TitleBarTab), findsOneWidget);
      expect(find.byType(BoardZoomInputField), findsOneWidget);
    });
  });
}

class _MockBoardBloc extends Mock implements BoardBloc {}
