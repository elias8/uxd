import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uxd/board/board.dart';
import 'package:uxd/models/models.dart';
import 'package:uxd/toolbar/toolbar.dart';

import '../../helpers/helpers.dart';

void main() {
  group('$Toolbar', () {
    late BoardBloc boardBloc;

    setUp(() {
      boardBloc = _MockBoardBloc();
      whenListen(boardBloc, Stream.value(BoardState.initial));
      when(() => boardBloc.state).thenReturn(BoardState.initial);
    });

    testWidgets('renders Toolbar', (tester) async {
      await tester.pumpApp(
        BlocProvider.value(
          value: boardBloc,
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

class _MockBoardBloc extends Mock implements BoardBloc {}
