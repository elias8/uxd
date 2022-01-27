import 'package:flutter/material.dart';

/// {@template child_wrapper}
/// Wraps a [child] widget when a given [shouldWrap] condition is true.
/// Otherwise, it will return the child widget itself.
/// {@endtemplate}
class ChildWrapper extends StatelessWidget {
  /// A child widget that will wrapped if [shouldWrap] is true.
  final Widget child;

  /// Defines whether the [child] widget should be wrapped with [wrap].
  final bool shouldWrap;

  /// A callback that will wrap a [child] widget when [shouldWrap] is true;
  final Widget Function(Widget child) wrap;

  /// {@macro child_wrapper}
  const ChildWrapper({
    Key? key,
    required this.wrap,
    required this.child,
    required this.shouldWrap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => shouldWrap ? wrap(child) : child;
}
