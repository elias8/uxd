import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uxd/titlebar/titlebar.dart';
import 'package:uxd/toolbar/toolbar.dart';

import '../../helpers/helpers.dart';

void main() {
  group('$TitleBarTab', () {
    late ToolbarBloc toolbarBloc;

    setUp(() {
      toolbarBloc = _MockToolbarBloc();
      whenListen(toolbarBloc, Stream.value(ToolbarState.initial));
    });

    testWidgets('renders TitleBarTab', (tester) async {
      await tester.pumpApp(const Scaffold(body: TitleBarTab()));

      expect(find.byType(Tab), findsNWidgets(BoardViewType.values.length));
    });

    testWidgets('should add a new event when a tab is selected',
        (tester) async {
      await tester.pumpApp(
        BlocProvider.value(
          value: toolbarBloc,
          child: const Scaffold(body: TitleBarTab()),
        ),
      );

      await tester.tap(find.byType(Tab).last);

      verify(() => toolbarBloc.add(const ToolbarEvent.boardViewTypeSelected(
          BoardViewType.prototype))).called(1);
    });
  });
}

class _MockToolbarBloc extends Mock implements ToolbarBloc {}
