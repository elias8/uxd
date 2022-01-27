part of 'toolbar_bloc.dart';

/// {@template toolbar_event}
/// A base event class for a [ToolbarBloc].
/// {@endtemplate}
abstract class ToolbarEvent extends Equatable {
  /// {@macro toolbar_event}
  const ToolbarEvent();

  /// An event for changing the current board [viewType].
  const factory ToolbarEvent.boardViewTypeSelected(BoardViewType viewType) =
      _BoarViewTypeSelected;

  /// An event for changing the current [designPanel].
  const factory ToolbarEvent.designPanelSelected([DesignPanel? designPanel]) =
      _DesignPanelSelected;

  /// An event for changing the current [designTool].
  const factory ToolbarEvent.designToolSelected(DesignTool designTool) =
      _DesignToolSelected;

  /// An event fo changing a zoom [level] of a design board.
  const factory ToolbarEvent.zoomLevelUpdated(ZoomLevel? level) =
      _ZoomLevelUpdated;
}

class _BoarViewTypeSelected extends ToolbarEvent {
  final BoardViewType viewType;

  const _BoarViewTypeSelected(this.viewType);

  @override
  List<Object> get props => [viewType];
}

class _DesignPanelSelected extends ToolbarEvent {
  final DesignPanel? designPanel;

  const _DesignPanelSelected([this.designPanel]);

  @override
  List<Object?> get props => [designPanel];
}

class _DesignToolSelected extends ToolbarEvent {
  final DesignTool designTool;

  const _DesignToolSelected(this.designTool);

  @override
  List<Object?> get props => [designTool];
}

class _ZoomLevelUpdated extends ToolbarEvent {
  final ZoomLevel? level;

  const _ZoomLevelUpdated(this.level);

  @override
  List<Object?> get props => [level];
}
