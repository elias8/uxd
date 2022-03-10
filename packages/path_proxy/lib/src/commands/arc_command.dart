// ignore_for_file: public_member_api_docs
// ignore_for_file: avoid_positional_boolean_parameters
import 'dart:ui';

import 'package:meta/meta.dart';

import 'path_command.dart';

@immutable
class ArcToPointCommand implements PathCommand {
  final Offset arcEnd;
  final Radius radius;
  final double rotation;
  final bool largeArc;
  final bool clockwise;

  const ArcToPointCommand(
    this.arcEnd,
    this.radius,
    this.rotation,
    this.largeArc,
    this.clockwise,
  );

  @override
  int get hashCode =>
      Object.hash(arcEnd, radius, rotation, largeArc, clockwise);

  @override
  bool operator ==(Object other) {
    return other is ArcToPointCommand &&
        arcEnd == other.arcEnd &&
        radius == other.radius &&
        rotation == other.rotation &&
        largeArc == other.largeArc &&
        clockwise == other.clockwise;
  }

  @override
  void apply(Path path) {
    path.arcToPoint(
      arcEnd,
      radius: radius,
      rotation: rotation,
      largeArc: largeArc,
      clockwise: clockwise,
    );
  }

  @override
  String toFlutterString() {
    return '..arcToPoint($arcEnd, radius: $radius, rotation: $rotation, '
        'largeArc: $largeArc, clockwise: $clockwise)';
  }

  @override
  String toSvgString() {
    final rx = radius.x;
    final ry = radius.y;
    final angle = rotation;
    final largeArcFlag = largeArc ? '1' : '0';
    final sweepFlag = clockwise ? '1' : '0';
    final x = arcEnd.dx;
    final y = arcEnd.dy;
    return 'A $rx $ry $angle $largeArcFlag $sweepFlag $x $y';
  }
}

@immutable
class RelativeArcToPointCommand implements PathCommand {
  final Offset arcDelta;
  final Radius radius;
  final double rotation;
  final bool largeArc;
  final bool clockwise;

  const RelativeArcToPointCommand(
    this.arcDelta,
    this.radius,
    this.rotation,
    this.largeArc,
    this.clockwise,
  );

  @override
  int get hashCode {
    return Object.hash(arcDelta, radius, rotation, largeArc, clockwise);
  }

  @override
  bool operator ==(Object other) {
    return other is RelativeArcToPointCommand &&
        other.arcDelta == arcDelta &&
        other.radius == radius &&
        other.rotation == rotation &&
        other.largeArc == largeArc &&
        other.clockwise == clockwise;
  }

  @override
  void apply(Path path) {
    path.relativeArcToPoint(
      arcDelta,
      radius: radius,
      rotation: rotation,
      largeArc: largeArc,
      clockwise: clockwise,
    );
  }

  @override
  String toFlutterString() {
    return '..relativeArcToPoint($arcDelta, radius: $radius, rotation: '
        '$rotation, largeArc: $largeArc, clockwise: $clockwise)';
  }

  @override
  String toSvgString() {
    final rx = radius.x;
    final ry = radius.y;
    final x = arcDelta.dx;
    final y = arcDelta.dy;
    final sweepFlag = clockwise ? '1' : '0';
    final largeArcFlag = largeArc ? '1' : '0';
    return 'a $rx $ry $rotation $largeArcFlag $sweepFlag $x $y';
  }
}
