import 'package:equatable/equatable.dart';
import 'package:flutter/painting.dart';
import 'package:vector_math/vector_math_64.dart';

import 'zoom_level.dart';

/// {@template board}
/// A two dimensional board model.
/// {@endtemplate}
class Board extends Equatable {
  /// The size of a board on the x axis.
  final double width;

  /// The size of a board on the y axis.
  final double height;

  /// The transformation of the board.
  final Matrix4 transform;

  /// {@macro board}
  const Board({
    this.width = 50000,
    this.height = 50000,
    required this.transform,
  });

  @override
  List<Object> get props => [width, height, transform];

  /// Returns the current zoom level.
  ZoomLevel get zoomLevel => ZoomLevel(transform.getMaxScaleOnAxis());

  /// Returns a new [Board] by copying the [transform] value.
  Board copyWith({Matrix4? transform, Offset? offset}) {
    return Board(
      width: width,
      height: height,
      transform: transform ?? this.transform,
    );
  }
}
