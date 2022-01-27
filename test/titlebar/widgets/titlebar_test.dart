import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fxd/titlebar/titlebar.dart';
import 'package:fxd/toolbar/toolbar.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/widget_tester_extension.dart';

void main() {
  group('$TitleBar', () {
    late ToolbarBloc toolbarBloc;

    setUp(() {
      toolbarBloc = _MockToolbarBloc();
      whenListen(toolbarBloc, Stream.value(ToolbarState.initial));
      when(() => toolbarBloc.state).thenReturn(ToolbarState.initial);
    });

    testWidgets('renders TitleBar', (tester) async {
      await tester.pumpApp(
        BlocProvider.value(
          value: toolbarBloc,
          child: const Scaffold(body: TitleBar()),
        ),
      );

      expect(find.byType(TitleBar), findsOneWidget);
      expect(find.byType(TitleBarTab), findsOneWidget);
      expect(find.byType(ZoomLevelInputField), findsOneWidget);
    });
  });
}

class _MockToolbarBloc extends Mock implements ToolbarBloc {}
