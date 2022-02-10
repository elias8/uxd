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
  group('$DesignPanelContainer', () {
    late BoardBloc boardBloc;

    setUp(() {
      boardBloc = _MockBoardBloc();
      whenListen(boardBloc, Stream.value(BoardState.initial));
      when(() => boardBloc.state).thenReturn(BoardState.initial);
    });

    testWidgets('renders DesignPanelContainer', (tester) async {
      await tester.pumpApp(
        BlocProvider.value(
          value: boardBloc,
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
      when(() => boardBloc.state).thenReturn(
        BoardState.initial.copyWith(
          designTool: DesignTool.text,
          designPanel: DesignPanel.layers,
        ),
      );
      await tester.pumpApp(
        BlocProvider.value(
          value: boardBloc,
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

class _MockBoardBloc extends Mock implements BoardBloc {}
