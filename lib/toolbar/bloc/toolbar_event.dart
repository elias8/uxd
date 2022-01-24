part of 'toolbar_bloc.dart';

/// {@template toolbar_event}
/// A base event class for a [ToolbarBloc].
/// {@endtemplate}
abstract class ToolbarEvent extends Equatable {
  /// {@macro toolbar_event}
  const ToolbarEvent();

  /// An event for changing the current [designPanel].
  const factory ToolbarEvent.designPanelSelected([DesignPanel? designPanel]) =
      _DesignPanelSelected;

  /// An event for changing the current [designTool].
  const factory ToolbarEvent.designToolSelected(DesignTool designTool) =
      _DesignToolSelected;
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
