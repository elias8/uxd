// ignore_for_file: public_member_api_docs
import 'dart:ui';

import 'package:meta/meta.dart';

import 'path_command.dart';

@immutable
class QuadraticBezierToCommand implements PathCommand {
  final double x1;
  final double y1;
  final double x2;
  final double y2;

  const QuadraticBezierToCommand(this.x1, this.y1, this.x2, this.y2);

  @override
  int get hashCode => Object.hash(x1, y1, x2, y2);

  @override
  bool operator ==(Object other) {
    return other is QuadraticBezierToCommand &&
        other.x1 == x1 &&
        other.y1 == y1 &&
        other.x2 == x2 &&
        other.y2 == y2;
  }

  @override
  void apply(Path path) => path.quadraticBezierTo(x1, y1, x2, y2);

  @override
  String toFlutterString() => '..quadraticBezierTo($x1, $y1, $x2, $y2)';

  @override
  String toSvgString() => 'Q $x1 $y1 $x2 $y2';
}

@immutable
class RelativeQuadraticBezierToCommand implements PathCommand {
  final double dx1;
  final double dy1;
  final double dx2;
  final double dy2;

  const RelativeQuadraticBezierToCommand(
      this.dx1, this.dy1, this.dx2, this.dy2);

  @override
  int get hashCode => Object.hash(dx1, dy1, dx2, dy2);

  @override
  bool operator ==(Object other) {
    return other is RelativeQuadraticBezierToCommand &&
        other.dx1 == dx1 &&
        other.dy1 == dy1 &&
        other.dx2 == dx2 &&
        other.dy2 == dy2;
  }

  @override
  void apply(Path path) => path.relativeQuadraticBezierTo(dx1, dy1, dx2, dy2);

  @override
  String toFlutterString() {
    return '..relativeQuadraticBezierTo($dx1, $dy1, $dx2, $dy2)';
  }

  @override
  String toSvgString() => 'q $dx1 $dy1 $dx2 $dy2';
}
