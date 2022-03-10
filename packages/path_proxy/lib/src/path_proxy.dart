// ignore_for_file: public_member_api_docs
import 'dart:ui';

import 'package:flutter/cupertino.dart';

import 'commands/commands.dart';

part 'path_proxy_impl.dart';

/// {@template path_proxy}
///  A proxy object that allows you to call methods on a [Path] object.
/// {@endtemplate}
abstract class PathProxy {
  /// {@macro path_proxy}
  factory PathProxy() = _PathProxyImpl;

  PathFillType get fillType;

  set fillType(PathFillType value);

  void arcToPoint(
    Offset arcEnd, {
    Radius radius = Radius.zero,
    double rotation = 0.0,
    bool largeArc = false,
    bool clockwise = true,
  });

  void close();

  bool contains(Offset point);

  void cubicTo(
    double x1,
    double y1,
    double x2,
    double y2,
    double x3,
    double y3,
  );

  void lineTo(double x, double y);

  void moveTo(double x, double y);

  void quadraticBezierTo(double x1, double y1, double x2, double y2);

  void relativeArcToPoint(
    Offset arcEnd, {
    Radius radius = Radius.zero,
    double rotation = 0.0,
    bool largeArc = false,
    bool clockwise = true,
  });

  void relativeCubicTo(
    double x1,
    double y1,
    double x2,
    double y2,
    double x3,
    double y3,
  );

  void relativeLineTo(double dx, double dy);

  void relativeMoveTo(double dx, double dy);

  void relativeQuadraticBezierTo(double x1, double y1, double x2, double y2);

  void reset();

  /// Returns a dart:ui Path representation of this path.
  String toFlutterString();

  /// Returns a dart:ui Path representation.
  Path toPath();

  /// Returns a SVG path string representation of this path.
  String toSvgString();
}
