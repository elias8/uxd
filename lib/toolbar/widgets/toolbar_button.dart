import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// {@template toolbar_button}
/// A button displayed on the toolbar.
/// {@endtemplate}
class ToolbarButton extends StatelessWidget {
  /// Defines if the button is currently active.
  final bool isActive;

  /// A tooltip message.
  final String? tooltip;

  /// The path to the svg asset image.
  final String svgIconPath;

  /// A callback to handle a tap event.
  final VoidCallback? onTap;

  /// {@macro toolbar_button}
  const ToolbarButton({
    Key? key,
    this.onTap,
    this.tooltip,
    this.isActive = false,
    required this.svgIconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconColor = isActive ? Colors.blue : null;
    final icon = SvgPicture.asset(svgIconPath, color: iconColor);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.all(8),
        child: tooltip != null ? Tooltip(message: tooltip, child: icon) : icon,
      ),
    );
  }
}
