import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';

part 'toolbar_event.dart';
part 'toolbar_state.dart';

typedef _Emitter = Emitter<ToolbarState>;

/// {@template toolbar_bloc}
/// A bloc responsible for a toolbar related events.
/// {@endtemplate}
class ToolbarBloc extends Bloc<ToolbarEvent, ToolbarState> {
  /// {@macro toolbar_bloc}
  ToolbarBloc() : super(ToolbarState.initial) {
    on<_BoarViewTypeSelected>(_onBoardViewTypeSelected);
    on<_DesignPanelSelected>(_onDesignPanelSelected);
    on<_DesignToolSelected>(_onDesignToolSelected);
    on<_ZoomLevelUpdated>(_onZoomLevelUpdated);
  }

  void _onBoardViewTypeSelected(_BoarViewTypeSelected event, _Emitter emit) {
    emit(state.copyWith(boardViewType: event.viewType));
  }

  void _onDesignPanelSelected(_DesignPanelSelected event, _Emitter emit) {
    final newPanel = event.designPanel;
    final currentPanel = state.designPanel;
    final panel = newPanel == currentPanel ? null : newPanel;
    emit(state.resetPanel().copyWith(designPanel: panel));
  }

  void _onDesignToolSelected(_DesignToolSelected event, _Emitter emit) {
    emit(state.copyWith(designTool: event.designTool));
  }

  void _onZoomLevelUpdated(_ZoomLevelUpdated event, _Emitter emit) {
    final newZoomLevel = event.level;
    final currentZoomLevel = state.zoomLevel;
    final zoomLevel = newZoomLevel?.optimize() ?? currentZoomLevel;
    emit(state.copyWith(zoomLevel: zoomLevel));
  }
}
