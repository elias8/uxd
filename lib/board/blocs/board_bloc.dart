import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';
import '../models/models.dart';

part 'board_event.dart';
part 'board_state.dart';

typedef _Emitter = Emitter<BoardState>;

/// {@templated board_bloc}
/// A bloc responsible for design board related events.
/// {@endtemplate}
class BoardBloc extends Bloc<BoardEvent, BoardState> {
  /// {@macro board_bloc}
  BoardBloc() : super(BoardState.initial) {
    on<_BoarViewTypeSelected>(_onBoardViewTypeSelected);
    on<_DesignPanelSelected>(_onDesignPanelSelected);
    on<_DesignToolSelected>(_onDesignToolSelected);
    on<_BoardZoomChanged>(_onZoomChanged);

    // Gesture Events
    on<_BoardHovered>(_onHovered);
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

  void _onHovered(_BoardHovered event, _Emitter emit) {
    emit(state.copyWith(hoverLocation: event.location));
  }

  void _onZoomChanged(_BoardZoomChanged event, _Emitter emit) {
    final zoom = event.zoom?.optimize() ?? state.zoom;
    emit(state.copyWith(zoom: zoom));
  }
}
