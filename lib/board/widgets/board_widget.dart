import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/board_bloc.dart';
import '../models/models.dart';
import 'transformation_extension.dart';

/// The size of the board.
const _dimension = 50000.0;

/// {@template board_widget}
/// A widget that allows zooming, panning, and handles different events that
/// occur on the board.
/// {@endtemplate}
class BoardWidget extends StatefulWidget {
  /// A widget shown inside the board.
  final Widget child;

  /// {@macro board_widget}
  const BoardWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<BoardWidget> createState() => _BoardWidgetState();
}

class _BoardWidgetState extends State<BoardWidget> {
  Offset? _scrollStart;
  bool _isMetaKeyPressed = false;
  late final _parentKey = GlobalKey();
  late final _focusNode = FocusNode();
  late final TransformationController _controller;
  late final _boardBloc = context.read<BoardBloc>();

  Rect get _boundaryRect {
    const childSize = Size.square(_dimension);
    const boundaryMargin = EdgeInsets.zero;
    final rect = Offset.zero & childSize;
    return boundaryMargin.inflateRect(rect);
  }

  Matrix4 get _transformation => _controller.value;

  Rect get _viewport {
    assert(_parentKey.currentContext != null);
    final currentContext = _parentKey.currentContext!;
    final parentRenderBox = currentContext.findRenderObject()! as RenderBox;
    return Offset.zero & parentRenderBox.size;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BoardBloc, BoardState>(
      listenWhen: _boardBlocListenerCondition,
      listener: _boardBlocListener,
      child: KeyboardListener(
        autofocus: true,
        focusNode: _focusNode,
        onKeyEvent: _handleKeyEvent,
        child: MouseRegion(
          onExit: _resetHover,
          onHover: _onHoverEvent,
          child: GestureDetector(
            onTap: _focusNode.requestFocus,
            behavior: HitTestBehavior.opaque,
            child: Listener(
              behavior: HitTestBehavior.opaque,
              onPointerSignal: _onPointerSignal,
              child: InteractiveViewer(
                key: _parentKey,
                panEnabled: false,
                constrained: false,
                minScale: BoardZoom.minLevel,
                maxScale: BoardZoom.maxLevel,
                scaleEnabled: _isMetaKeyPressed,
                transformationController: _controller,
                child: Container(
                  width: _dimension,
                  height: _dimension,
                  color: const Color(0XFFE4E4E4),
                  child: widget.child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    final initialZoom = _boardBloc.state.zoom.level;
    final initialTransformation = Matrix4.identity()..scale(initialZoom);
    _controller = TransformationController(initialTransformation);
    _controller.addListener(_transformationListener);
    _focusNode.requestFocus();
  }

  void _boardBlocListener(BuildContext context, BoardState state) {
    if (_transformation.getMaxScaleOnAxis() != state.zoom.level) {
      _updateZoom(state.zoom.level);
    }
  }

  bool _boardBlocListenerCondition(BoardState previous, BoardState current) {
    return current.zoom.level != _transformation.getMaxScaleOnAxis();
  }

  double _clampScale(double scale) {
    final clampedTotalScale = BoardZoom.clamp(scale);
    final currentScale = _transformation.getMaxScaleOnAxis();
    final clampedScale = clampedTotalScale / currentScale;
    return clampedScale;
  }

  void _handleKeyEvent(KeyEvent event) {
    final isKeyDown = event is KeyDownEvent;
    final isMetaKey = event.physicalKey == PhysicalKeyboardKey.metaLeft;
    final isMetaKeyPressed = isMetaKey && isKeyDown;
    if (isMetaKeyPressed != _isMetaKeyPressed) {
      _isMetaKeyPressed = isMetaKeyPressed;
      setState(() {});
    }
  }

  void _onHoverEvent(PointerHoverEvent event) {
    final location = _controller.toScene(event.localPosition);
    _boardBloc.add(BoardEvent.hovered(location));
  }

  void _onPointerSignal(PointerSignalEvent event) {
    if (!_isMetaKeyPressed && event is PointerScrollEvent) {
      GestureBinding.instance?.pointerSignalResolver.register(event, (event) {
        if (event is PointerScrollEvent) {
          if (event.scrollDelta.dy == 0) return;
          final currentPosition = event.scrollDelta;
          _scrollStart ??= currentPosition;
          if (_scrollStart == currentPosition) return;
          _scrollStart = _scrollStart! - currentPosition;
          final translation = _transformation.toScene(_scrollStart!);
          _translate(_transformation, translation);
        }
      });
    }
  }

  void _reportZoomUpdate() {
    final zoom = BoardZoom(_transformation.getMaxScaleOnAxis());
    _boardBloc.add(BoardEvent.zoomChanged(zoom));
  }

  void _resetHover(PointerExitEvent _) {
    _boardBloc.add(const BoardEvent.hovered());
  }

  void _setStartScroll() {
    final vector3 = _transformation.getTranslation();
    final translation = Offset(vector3.x, vector3.y);
    _scrollStart = translation;
  }

  void _transformationListener() {
    _reportZoomUpdate();
    _setStartScroll();
  }

  void _translate(Matrix4 matrix4, Offset translation) {
    _controller.value = matrix4.translate4(
      translation,
      _viewport,
      _boundaryRect,
    );
  }

  void _updateZoom(double level) {
    final scale = _clampScale(level);
    final position = _viewport.center;
    final focalPointScene = _transformation.toScene(position);
    final scaledTransformation = _transformation.clone()..scale(scale);
    final focalPointSceneScaled = scaledTransformation.toScene(position);
    final translation = focalPointSceneScaled - focalPointScene;
    _translate(scaledTransformation, translation);
  }
}
