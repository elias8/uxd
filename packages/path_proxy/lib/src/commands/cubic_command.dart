// ignore_for_file: public_member_api_docs
import 'dart:ui';

import 'package:meta/meta.dart';

import 'path_command.dart';

@immutable
class CubicToCommand implements PathCommand {
  final double x1;
  final double y1;
  final double x2;
  final double y2;
  final double x3;
  final double y3;

  const CubicToCommand(this.x1, this.y1, this.x2, this.y2, this.x3, this.y3);

  @override
  int get hashCode => Object.hash(x1, y1, x2, y2, x3, y3);

  @override
  bool operator ==(Object other) {
    return other is CubicToCommand &&
        other.x1 == x1 &&
        other.y1 == y1 &&
        other.x2 == x2 &&
        other.y2 == y2 &&
        other.x3 == x3 &&
        other.y3 == y3;
  }

  @override
  void apply(Path path) => path.cubicTo(x1, y1, x2, y2, x3, y3);

  @override
  String toFlutterString() => '..cubicTo($x1, $y1, $x2, $y2, $x3, $y3)';

  @override
  String toSvgString() => 'C $x1 $y1 $x2 $y2 $x3 $y3';
}

@immutable
class RelativeCubicToCommand implements PathCommand {
  final double dx1;
  final double dy1;
  final double dx2;
  final double dy2;
  final double dx3;
  final double dy3;

  const RelativeCubicToCommand(
      this.dx1, this.dy1, this.dx2, this.dy2, this.dx3, this.dy3);

  @override
  int get hashCode => Object.hash(dx1, dy1, dx2, dy2, dx3, dy3);

  @override
  bool operator ==(Object other) {
    return other is RelativeCubicToCommand &&
        other.dx1 == dx1 &&
        other.dy1 == dy1 &&
        other.dx2 == dx2 &&
        other.dy2 == dy2 &&
        other.dx3 == dx3 &&
        other.dy3 == dy3;
  }

  @override
  void apply(Path path) => path.relativeCubicTo(dx1, dy1, dx2, dy2, dx3, dy3);

  @override
  String toFlutterString() {
    return '..relativeCubicTo($dx1, $dy1, $dx2, $dy2, $dx3, $dy3)';
  }

  @override
  String toSvgString() => 'c $dx1 $dy1 $dx2 $dy2 $dx3 $dy3';
}
