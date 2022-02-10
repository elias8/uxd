import 'package:equatable/equatable.dart';

/// {@template board_zoom}
/// A design board zoom level.
///
/// The [level] can no be less than 0.025 and greater than 64.
/// {@endtemplate}
class BoardZoom extends Equatable {
  /// The minimum possible zoom level in %.
  static const minLevel = 0.025;

  /// The maximum possible zoom level in %.
  static const maxLevel = 64.0;

  /// Defines a zoom level with 25%.
  static const x25 = BoardZoom(0.25);

  /// Defines a zoom level with 33%.
  static const x33 = BoardZoom(0.33);

  /// Defines a zoom level with 50%.
  static const x50 = BoardZoom(0.5);

  /// Defines a zoom level with 100%.
  static const x100 = BoardZoom(1);

  /// Defines a zoom level with 150%.
  static const x150 = BoardZoom(1.5);

  /// Defines a zoom level with 200%.
  static const x200 = BoardZoom(2);

  /// Defines a zoom level with 300%.
  static const x300 = BoardZoom(3);

  /// Defines a zoom level with 400%.
  static const x400 = BoardZoom(4);

  /// The minimum possible zoom level.
  static const min = BoardZoom(minLevel);

  /// The maximum possible zoom level.
  static const max = BoardZoom(maxLevel);

  /// All predefined custom zoom levels.
  static const levels = <BoardZoom>[
    x25,
    x33,
    x50,
    x100,
    x150,
    x200,
    x300,
    x400,
  ];

  /// The zoom level in percentage. It ranges between 0 and 1, where 1 is equal
  /// to 100%.
  final double level;

  /// {@macro board_zoom}
  const BoardZoom(this.level);

  @override
  List<Object> get props => [level];

  /// Returns true when the current zoom [level] is lesser than the [other].
  bool operator <(BoardZoom other) => level < other.level;

  /// Returns true when the current zoom [level] is greater than the [other].
  bool operator >(BoardZoom other) => level > other.level;

  /// Returns a [BoardZoom] within a valid range.
  ///
  /// * if the [level] within a valid range, it returns the current [BoardZoom].
  /// * if the [level] less than the min value, it returns the [min].
  /// * if the [level] greater than the max value, it returns the [max].
  BoardZoom optimize() {
    if (level >= minLevel && level <= maxLevel) return this;
    if (level < minLevel) return min;
    return max;
  }

  /// Returns this num clamped to be in the range [minLevel]-[maxLevel]
  static double clamp(double level) => level.clamp(minLevel, maxLevel);

  /// Tries to parse a [BoardZoom] from a given String [value].
  ///
  /// Returns `null` if the string [value] does not match a valid zoom level or
  /// is not a valid number.
  static BoardZoom? tryParse(String value) {
    final number = double.tryParse(value);
    if (number != null) return BoardZoom(number / 100.0);
    return null;
  }
}
