import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fxd/toolbar/toolbar.dart';

void main() {
  group('$ToolbarBloc', () {
    late ToolbarBloc toolbarBloc;

    setUp(() {
      toolbarBloc = ToolbarBloc();
    });

    tearDown(() => toolbarBloc.close());

    group('_DesignToolSelected', () {
      blocTest<ToolbarBloc, ToolbarState>(
        'should emit [ ToolbarState ] when a new event is added',
        build: () => toolbarBloc,
        act: (bloc) =>
            bloc.add(const ToolbarEvent.designToolSelected(DesignTool.text)),
        expect: () => const [ToolbarState(DesignTool.text)],
      );
    });

    group('_DesignPanelSelected', () {
      blocTest<ToolbarBloc, ToolbarState>(
        'should emit [ ToolbarState, ToolbarState ] when a new event is added',
        build: () => toolbarBloc,
        act: (bloc) => bloc
          ..add(const ToolbarEvent.designPanelSelected(DesignPanel.layers))
          ..add(const ToolbarEvent.designPanelSelected(DesignPanel.layers)),
        expect: () => const [
          ToolbarState(DesignTool.selector, DesignPanel.layers),
          ToolbarState.initial,
        ],
      );
    });
  });
}
