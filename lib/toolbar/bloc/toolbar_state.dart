part of 'toolbar_bloc.dart';

/// {@template toolbar_state}
/// Contains the toolbar state.
/// {@endtemplate}
class ToolbarState extends Equatable {
  /// The initial state.
  static const ToolbarState initial = ToolbarState();

  /// Current design tool.
  final DesignTool designTool;

  /// Current design panel.
  final DesignPanel? designPanel;

  /// Current board view type.
  final BoardViewType boardViewType;

  /// Current zoom level of a design board.
  final ZoomLevel zoomLevel;

  /// {@macro toolbar_state}
  const ToolbarState({
    this.designPanel,
    this.zoomLevel = ZoomLevel.x33,
    this.designTool = DesignTool.selector,
    this.boardViewType = BoardViewType.design,
  });

  @override
  List<Object?> get props => [
        designTool,
        designPanel,
        boardViewType,
        zoomLevel,
      ];

  /// Copies a new value to the object.
  ToolbarState copyWith({
    ZoomLevel? zoomLevel,
    DesignTool? designTool,
    DesignPanel? designPanel,
    BoardViewType? boardViewType,
  }) {
    return ToolbarState(
      zoomLevel: zoomLevel ?? this.zoomLevel,
      designTool: designTool ?? this.designTool,
      designPanel: designPanel ?? this.designPanel,
      boardViewType: boardViewType ?? this.boardViewType,
    );
  }

  /// Returns a new state with an empty [designPanel].
  ToolbarState resetPanel() {
    return ToolbarState(designTool: designTool, boardViewType: boardViewType);
  }
}
