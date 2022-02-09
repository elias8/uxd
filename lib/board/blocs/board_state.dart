// ignore_for_file: public_member_api_docs
part of 'board_bloc.dart';

class BoardState extends Equatable {
  static final _initialTransform = Matrix4.identity()..scale(.33);
  static final initial = BoardState(board: Board(transform: _initialTransform));

  /// The current board state.
  final Board board;

  /// The current design tool.
  final DesignTool designTool;

  /// The current design panel.
  final DesignPanel? designPanel;

  /// The current board view type.
  final BoardViewType boardViewType;

  const BoardState({
    this.designPanel,
    required this.board,
    this.designTool = DesignTool.selector,
    this.boardViewType = BoardViewType.design,
  });

  @override
  List<Object?> get props => [
        board,
        designTool,
        designPanel,
        boardViewType,
      ];

  BoardState copyWith({
    Board? board,
    DesignTool? designTool,
    DesignPanel? designPanel,
    BoardViewType? boardViewType,
  }) {
    return BoardState(
      board: board ?? this.board,
      designTool: designTool ?? this.designTool,
      designPanel: designPanel ?? this.designPanel,
      boardViewType: boardViewType ?? this.boardViewType,
    );
  }

  /// Returns a new state with an empty [designPanel].
  BoardState resetPanel() {
    return BoardState(
      board: board,
      designTool: designTool,
      boardViewType: boardViewType,
    );
  }
}
