// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes
part of 'path_proxy.dart';

class _PathProxyImpl implements PathProxy {
  final _path = Path();
  bool _isApplied = false;
  final _commands = <PathCommand>[];

  @override
  PathFillType get fillType => _path.fillType;

  @override
  set fillType(PathFillType value) {
    _path.fillType = value;
  }

  @override
  int get hashCode => Object.hash(_path, _commands);

  @override
  bool operator ==(Object other) {
    return other is _PathProxyImpl &&
        other._path == _path &&
        other._commands == _commands;
  }

  @override
  void arcToPoint(
    Offset arcEnd, {
    Radius radius = Radius.zero,
    double rotation = 0.0,
    bool largeArc = false,
    bool clockwise = true,
  }) {
    _addCommand(ArcToPointCommand(
      arcEnd,
      radius,
      rotation,
      largeArc,
      clockwise,
    ));
  }

  @override
  void close() => _addCommand(const CloseCommand());

  @override
  bool contains(Offset point) {
    _build();
    return _path.contains(point);
  }

  @override
  void cubicTo(
    double x1,
    double y1,
    double x2,
    double y2,
    double x3,
    double y3,
  ) {
    _addCommand(CubicToCommand(x1, y1, x2, y2, x3, y3));
  }

  @override
  void lineTo(double x, double y) => _addCommand(LineToCommand(x, y));

  @override
  void moveTo(double x, double y) => _addCommand(MoveToCommand(x, y));

  @override
  void quadraticBezierTo(double x1, double y1, double x2, double y2) {
    _addCommand(QuadraticBezierToCommand(x1, y1, x2, y2));
  }

  @override
  void relativeArcToPoint(
    Offset arcEnd, {
    Radius radius = Radius.zero,
    double rotation = 0.0,
    bool largeArc = false,
    bool clockwise = true,
  }) {
    _addCommand(RelativeArcToPointCommand(
      arcEnd,
      radius,
      rotation,
      largeArc,
      clockwise,
    ));
  }

  @override
  void relativeCubicTo(
    double x1,
    double y1,
    double x2,
    double y2,
    double x3,
    double y3,
  ) {
    _addCommand(RelativeCubicToCommand(x1, y1, x2, y2, x3, y3));
  }

  @override
  void relativeLineTo(double dx, double dy) {
    _addCommand(RelativeLineToCommand(dx, dy));
  }

  @override
  void relativeMoveTo(double dx, double dy) {
    _addCommand(RelativeMoveToCommand(dx, dy));
  }

  @override
  void relativeQuadraticBezierTo(double x1, double y1, double x2, double y2) {
    _addCommand(RelativeQuadraticBezierToCommand(x1, y1, x2, y2));
  }

  @override
  void reset() {
    _path.reset();
    _commands.clear();
  }

  @override
  String toFlutterString() {
    final StringBuffer buffer = StringBuffer('Path()');
    for (final PathCommand command in _commands) {
      buffer.write('\n  ${command.toFlutterString()}');
    }
    buffer.write(';');
    return buffer.toString();
  }

  @override
  Path toPath() {
    _build();
    return _path;
  }

  @override
  String toSvgString() {
    final StringBuffer buffer = StringBuffer();
    for (final PathCommand command in _commands) {
      buffer.write(command.toSvgString());
    }
    return buffer.toString();
  }

  void _addCommand(PathCommand command) {
    _commands.add(command);
    _isApplied = false;
  }

  void _build() {
    if (_isApplied) return;
    _path.reset();
    for (final command in _commands) {
      command.apply(_path);
    }
    _isApplied = true;
  }
}
