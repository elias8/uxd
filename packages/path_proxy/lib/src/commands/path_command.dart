import 'dart:ui';

/// {@template path_command}
/// A single operation in a [Path] that records the drawing instructions.
/// {@endtemplate}
abstract class PathCommand {
  /// {@macro path_command}
  const PathCommand();

  /// Applies the command to the given [path].
  void apply(Path path);

  /// Returns a dart:ui Path representation of the this command.
  String toFlutterString();

  /// Returns an SVG string representation of this path command.
  String toSvgString();
}
