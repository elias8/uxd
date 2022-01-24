part of 'toolbar_bloc.dart';

/// {@template toolbar_state}
/// Contains the toolbar state.
/// {@endtemplate}
class ToolbarState extends Equatable {
  /// The initial state.
  static const ToolbarState initial = ToolbarState(DesignTool.selector);

  /// Current design tool.
  final DesignTool designTool;

  /// Current design panel.
  final DesignPanel? designPanel;

  /// {@macro toolbar_state}
  const ToolbarState(this.designTool, [this.designPanel]);

  @override
  List<Object?> get props => [designTool, designPanel];
}
