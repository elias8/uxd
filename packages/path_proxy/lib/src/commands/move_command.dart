// ignore_for_file: public_member_api_docs
import 'dart:ui';

import 'package:meta/meta.dart';

import 'path_command.dart';

@immutable
class MoveToCommand implements PathCommand {
  final double x;
  final double y;

  const MoveToCommand(this.x, this.y);

  @override
  int get hashCode => Object.hash(x, y);

  @override
  bool operator ==(Object other) {
    return other is MoveToCommand && other.x == x && other.y == y;
  }

  @override
  void apply(Path path) => path.moveTo(x, y);

  @override
  String toFlutterString() => '..moveTo($x, $y)';

  @override
  String toSvgString() => 'M $x $y';
}

@immutable
class RelativeMoveToCommand implements PathCommand {
  final double dx;
  final double dy;

  const RelativeMoveToCommand(this.dx, this.dy);

  @override
  int get hashCode => Object.hash(dx, dy);

  @override
  bool operator ==(Object other) {
    return other is RelativeMoveToCommand && other.dx == dx && other.dy == dy;
  }

  @override
  void apply(Path path) => path.relativeMoveTo(dx, dy);

  @override
  String toFlutterString() => '..relativeMoveTo($dx, $dy)';

  @override
  String toSvgString() => 'm $dx $dy';
}
