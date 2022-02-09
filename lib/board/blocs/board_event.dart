// ignore_for_file: public_member_api_docs
part of 'board_bloc.dart';

/// {@template toolbar_event}
/// A base event class for a [BoardBloc].
/// {@endtemplate}
abstract class BoardEvent extends Equatable {
  const BoardEvent();

  /// An event for changing the current board [viewType].
  const factory BoardEvent.boardViewTypeSelected(BoardViewType viewType) =
      _BoarViewTypeSelected;

  /// An event for changing the current [designPanel].
  const factory BoardEvent.designPanelSelected([DesignPanel? designPanel]) =
      _DesignPanelSelected;

  /// An event for changing the current [designTool].
  const factory BoardEvent.designToolSelected(DesignTool designTool) =
      _DesignToolSelected;
}

class _BoarViewTypeSelected extends BoardEvent {
  final BoardViewType viewType;

  const _BoarViewTypeSelected(this.viewType);

  @override
  List<Object> get props => [viewType];
}

class _DesignPanelSelected extends BoardEvent {
  final DesignPanel? designPanel;

  const _DesignPanelSelected([this.designPanel]);

  @override
  List<Object?> get props => [designPanel];
}

class _DesignToolSelected extends BoardEvent {
  final DesignTool designTool;

  const _DesignToolSelected(this.designTool);

  @override
  List<Object?> get props => [designTool];
}
