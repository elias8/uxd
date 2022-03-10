// ignore_for_file: public_member_api_docs
import 'dart:ui';

import 'package:meta/meta.dart';

import 'path_command.dart';

@immutable
class LineToCommand implements PathCommand {
  final double x;
  final double y;

  const LineToCommand(this.x, this.y);

  @override
  int get hashCode => Object.hash(x, y);

  @override
  bool operator ==(Object other) {
    return other is LineToCommand && other.x == x && other.y == y;
  }

  @override
  void apply(Path path) => path.lineTo(x, y);

  @override
  String toFlutterString() => '..lineTo($x, $y)';

  @override
  String toSvgString() => 'L $x $y';
}

@immutable
class RelativeLineToCommand implements PathCommand {
  final double dx;
  final double dy;

  const RelativeLineToCommand(this.dx, this.dy);

  @override
  int get hashCode => Object.hash(dx, dy);

  @override
  bool operator ==(Object other) {
    return other is RelativeLineToCommand && other.dx == dx && other.dy == dy;
  }

  @override
  void apply(Path path) => path.relativeLineTo(dx, dy);

  @override
  String toFlutterString() => '..relativeLineTo($dx, $dy)';

  @override
  String toSvgString() => 'l $dx $dy';
}
