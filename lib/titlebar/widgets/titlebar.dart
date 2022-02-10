import 'package:flutter/material.dart';

import '../../board/board.dart';
import '../../helpers/helpers.dart';
import '../../l10n/l10n.dart';
import '../titlebar.dart';

const _kTitleBarHeight = 38.0;

/// {@template title_bar}
/// Shows a window title bar.
///
/// It is a replacement of the native title bar widget on desktop. And will be
/// shown as an app bar on web.
/// {@endtemplate}
class TitleBar extends StatelessWidget {
  /// {@macro title_bar}
  const TitleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMacosDesktop = !pIsWeb && pIsMacOS;
    return Container(
      width: double.infinity,
      height: _kTitleBarHeight,
      color: const Color(0XFFF7F7F7),
      child: Padding(
        padding: EdgeInsets.only(left: isMacosDesktop ? 70 : 8, right: 8),
        child: Row(
          children: const [
            Expanded(child: _TitleBarLeading()),
            _AppTitle(),
            Expanded(child: _TitleBarAction()),
          ],
        ),
      ),
    );
  }
}

class _AppTitle extends StatelessWidget {
  const _AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Center(
      child: Text(
        l10n.appName,
        style: const TextStyle(color: Color(0xFF616161)),
      ),
    );
  }
}

class _TitleBarAction extends StatelessWidget {
  const _TitleBarAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        BoardZoomInputField(),
      ],
    );
  }
}

class _TitleBarLeading extends StatelessWidget {
  const _TitleBarLeading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Padding(
          padding: EdgeInsets.only(left: 12, right: 8),
          child: Icon(Icons.home_rounded, size: 20),
        ),
        TitleBarTab(),
      ],
    );
  }
}
