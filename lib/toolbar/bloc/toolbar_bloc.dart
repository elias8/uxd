import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../toolbar.dart';

part 'toolbar_event.dart';
part 'toolbar_state.dart';

typedef _Emitter = Emitter<ToolbarState>;

/// {@template toolbar_bloc}
/// A bloc responsible for a toolbar related events.
/// {@endtemplate}
class ToolbarBloc extends Bloc<ToolbarEvent, ToolbarState> {
  /// {@macro toolbar_bloc}
  ToolbarBloc() : super(ToolbarState.initial) {
    on<_DesignToolSelected>(_onDesignToolSelected);
    on<_DesignPanelSelected>(_onDesignPanelSelected);
  }

  void _onDesignPanelSelected(_DesignPanelSelected event, _Emitter emit) {
    final newPanel = event.designPanel;
    final currentPanel = state.designPanel;
    final panel = newPanel == currentPanel ? null : newPanel;
    emit(ToolbarState(state.designTool, panel));
  }

  void _onDesignToolSelected(_DesignToolSelected event, _Emitter emit) {
    emit(ToolbarState(event.designTool, state.designPanel));
  }
}
