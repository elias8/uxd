import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uxd/board/board.dart';
import 'package:uxd/models/models.dart';

void main() {
  group('$BoardBloc', () {
    late BoardBloc boardBloc;

    setUp(() {
      boardBloc = BoardBloc();
    });

    tearDown(() => boardBloc.close());

    group('_BoarViewTypeSelected', () {
      blocTest<BoardBloc, BoardState>(
        'should emit [ BoardState ] when a new event is added',
        build: () => boardBloc,
        act: (bloc) => bloc.add(
            const BoardEvent.boardViewTypeSelected(BoardViewType.prototype)),
        expect: () => [
          BoardState.initial.copyWith(boardViewType: BoardViewType.prototype),
        ],
      );
    });

    group('_DesignToolSelected', () {
      blocTest<BoardBloc, BoardState>(
        'should emit [ BoardState ] when a new event is added',
        build: () => boardBloc,
        act: (bloc) =>
            bloc.add(const BoardEvent.designToolSelected(DesignTool.text)),
        expect: () => [
          BoardState.initial.copyWith(designTool: DesignTool.text),
        ],
      );
    });

    group('_DesignPanelSelected', () {
      blocTest<BoardBloc, BoardState>(
        'should emit [ BoardState, BoardState ] when a new event is added',
        build: () => boardBloc,
        act: (bloc) => bloc
          ..add(const BoardEvent.designPanelSelected(DesignPanel.layers))
          ..add(const BoardEvent.designPanelSelected(DesignPanel.layers)),
        expect: () => [
          BoardState.initial.copyWith(designPanel: DesignPanel.layers),
          BoardState.initial,
        ],
      );
    });

    group('_BoardZoomChanged', () {
      blocTest<BoardBloc, BoardState>(
        'should emit [ BoardState, BoardState, BoardState, BoardState, '
        'BoardState, BoardState ] when zoom is selected',
        build: () => boardBloc,
        act: (bloc) => bloc
          ..add(const BoardEvent.zoomChanged())
          ..add(const BoardEvent.zoomChanged(BoardZoom(23.2)))
          ..add(const BoardEvent.zoomChanged(BoardZoom(0.001)))
          ..add(const BoardEvent.zoomChanged(BoardZoom(1000)))
          ..add(const BoardEvent.zoomChanged(BoardZoom(10)))
          ..add(const BoardEvent.zoomChanged(BoardZoom.max)),
        expect: () => const [
          BoardState.initial,
          BoardState(zoom: BoardZoom(23.2)),
          BoardState(zoom: BoardZoom.min),
          BoardState(zoom: BoardZoom.max),
          BoardState(zoom: BoardZoom(10)),
          BoardState(zoom: BoardZoom.max),
        ],
      );
    });

    group('_BoardHovered', () {
      blocTest<BoardBloc, BoardState>(
        'should emit [ BoardState ] when a hover event is added',
        build: () => boardBloc,
        act: (bloc) => bloc.add(const BoardEvent.hovered(Offset.zero)),
        expect: () => [BoardState.initial.copyWith(hoverLocation: Offset.zero)],
      );
    });
  });
}
