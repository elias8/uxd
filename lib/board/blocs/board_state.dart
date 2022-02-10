// ignore_for_file: public_member_api_docs
part of 'board_bloc.dart';

class BoardState extends Equatable {
  static const initial = BoardState();

  /// The current zoom level.
  final BoardZoom zoom;

  /// The current design tool.
  final DesignTool designTool;

  /// The current design panel.
  final DesignPanel? designPanel;

  /// The current board view type.
  final BoardViewType boardViewType;

  /// The current hover location.
  final Offset? hoverLocation;

  const BoardState({
    this.designPanel,
    this.hoverLocation,
    this.zoom = BoardZoom.x33,
    this.designTool = DesignTool.selector,
    this.boardViewType = BoardViewType.design,
  });

  @override
  List<Object?> get props => [
        zoom,
        designTool,
        designPanel,
        boardViewType,
        hoverLocation,
      ];

  BoardState copyWith({
    BoardZoom? zoom,
    Offset? hoverLocation,
    DesignTool? designTool,
    DesignPanel? designPanel,
    BoardViewType? boardViewType,
  }) {
    return BoardState(
      zoom: zoom ?? this.zoom,
      designTool: designTool ?? this.designTool,
      designPanel: designPanel ?? this.designPanel,
      boardViewType: boardViewType ?? this.boardViewType,
      hoverLocation: hoverLocation ?? this.hoverLocation,
    );
  }

  /// Returns a new state with an empty [designPanel].
  BoardState resetPanel() {
    return BoardState(
      zoom: zoom,
      designTool: designTool,
      boardViewType: boardViewType,
    );
  }
}
