import 'package:equatable/equatable.dart';

/// {@template zoom_level}
/// A design board zoom level.
///
/// The [level] can no be less than 0.025 and greater than 64.
/// {@endtemplate}
class ZoomLevel extends Equatable {
  /// The minimum possible zoom level in %.
  static const minLevel = 0.025;

  /// The maximum possible zoom level in %.
  static const maxLevel = 64.0;

  /// Defines a zoom level with 25%.
  static const x25 = ZoomLevel(0.25);

  /// Defines a zoom level with 33%.
  static const x33 = ZoomLevel(0.33);

  /// Defines a zoom level with 50%.
  static const x50 = ZoomLevel(0.5);

  /// Defines a zoom level with 100%.
  static const x100 = ZoomLevel(1);

  /// Defines a zoom level with 150%.
  static const x150 = ZoomLevel(1.5);

  /// Defines a zoom level with 200%.
  static const x200 = ZoomLevel(2);

  /// Defines a zoom level with 300%.
  static const x300 = ZoomLevel(3);

  /// Defines a zoom level with 400%.
  static const x400 = ZoomLevel(4);

  /// The minimum possible zoom level.
  static const min = ZoomLevel(minLevel);

  /// The maximum possible zoom level.
  static const max = ZoomLevel(maxLevel);

  /// All predefined custom zoom levels.
  static const levels = <ZoomLevel>[
    x25,
    x33,
    x50,
    x100,
    x150,
    x200,
    x300,
    x400,
  ];

  /// The zoom level in percentage.
  final double level;

  /// {@macro zoom_level}
  const ZoomLevel(this.level);

  @override
  List<Object> get props => [level];

  /// Returns true when the current zoom [level] is lesser than the [other].
  bool operator <(ZoomLevel other) => level < other.level;

  /// Returns true when the current zoom [level] is greater than the [other].
  bool operator >(ZoomLevel other) => level > other.level;

  /// Returns a [ZoomLevel] within a valid range.
  ///
  /// * if the [level] within a valid range, it returns the current [ZoomLevel].
  /// * if the [level] less than the min value, it returns the [min].
  /// * if the [level] greater than the max value, it returns the [max].
  ZoomLevel optimize() {
    if (level >= minLevel && level <= maxLevel) return this;
    if (level < minLevel) return min;
    return max;
  }

  /// Tries to parse a [ZoomLevel] from a given String [value].
  ///
  /// Returns `null` if the string [value] does not match a valid zoom level or
  /// is not a valid number.
  static ZoomLevel? tryParse(String value) {
    final number = double.tryParse(value);
    if (number != null) return ZoomLevel(number / 100.0);
    return null;
  }
}
