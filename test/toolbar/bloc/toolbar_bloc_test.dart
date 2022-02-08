import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uxd/models/models.dart';
import 'package:uxd/toolbar/toolbar.dart';

void main() {
  group('$ToolbarBloc', () {
    late ToolbarBloc toolbarBloc;

    setUp(() {
      toolbarBloc = ToolbarBloc();
    });

    tearDown(() => toolbarBloc.close());

    group('_BoarViewTypeSelected', () {
      blocTest<ToolbarBloc, ToolbarState>(
        'should emit [ ToolbarState ] when a new event is added',
        build: () => toolbarBloc,
        act: (bloc) => bloc.add(
            const ToolbarEvent.boardViewTypeSelected(BoardViewType.prototype)),
        expect: () => const [
          ToolbarState(boardViewType: BoardViewType.prototype),
        ],
      );
    });

    group('_DesignToolSelected', () {
      blocTest<ToolbarBloc, ToolbarState>(
        'should emit [ ToolbarState ] when a new event is added',
        build: () => toolbarBloc,
        act: (bloc) =>
            bloc.add(const ToolbarEvent.designToolSelected(DesignTool.text)),
        expect: () => const [ToolbarState(designTool: DesignTool.text)],
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
          ToolbarState(designPanel: DesignPanel.layers),
          ToolbarState.initial,
        ],
      );
    });

    group('_ZoomLevelUpdated', () {
      blocTest<ToolbarBloc, ToolbarState>(
        'should emit [ ToolbarState, ToolbarState ] when a new event is added',
        build: () => toolbarBloc,
        act: (bloc) => bloc
          ..add(const ToolbarEvent.zoomLevelUpdated(ZoomLevel.min))
          ..add(const ToolbarEvent.zoomLevelUpdated(ZoomLevel(20)))
          ..add(const ToolbarEvent.zoomLevelUpdated(ZoomLevel(65))),
        expect: () => const [
          ToolbarState(zoomLevel: ZoomLevel.min),
          ToolbarState(zoomLevel: ZoomLevel(20)),
          ToolbarState(zoomLevel: ZoomLevel.max),
        ],
      );
    });
  });
}
