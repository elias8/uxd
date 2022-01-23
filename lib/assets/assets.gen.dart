/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  $AssetsIconsToolbarGen get toolbar => const $AssetsIconsToolbarGen();
}

class $AssetsIconsToolbarGen {
  const $AssetsIconsToolbarGen();

  /// File path: assets/icons/toolbar/artboard.svg
  SvgGenImage get artboard =>
      const SvgGenImage('assets/icons/toolbar/artboard.svg');

  /// File path: assets/icons/toolbar/ellipse.svg
  SvgGenImage get ellipse =>
      const SvgGenImage('assets/icons/toolbar/ellipse.svg');

  /// File path: assets/icons/toolbar/line.svg
  SvgGenImage get line => const SvgGenImage('assets/icons/toolbar/line.svg');

  /// File path: assets/icons/toolbar/pen.svg
  SvgGenImage get pen => const SvgGenImage('assets/icons/toolbar/pen.svg');

  /// File path: assets/icons/toolbar/polygon.svg
  SvgGenImage get polygon =>
      const SvgGenImage('assets/icons/toolbar/polygon.svg');

  /// File path: assets/icons/toolbar/rectangle.svg
  SvgGenImage get rectangle =>
      const SvgGenImage('assets/icons/toolbar/rectangle.svg');

  /// File path: assets/icons/toolbar/selector.svg
  SvgGenImage get selector =>
      const SvgGenImage('assets/icons/toolbar/selector.svg');

  /// File path: assets/icons/toolbar/text.svg
  SvgGenImage get text => const SvgGenImage('assets/icons/toolbar/text.svg');

  /// File path: assets/icons/toolbar/zoom.svg
  SvgGenImage get zoom => const SvgGenImage('assets/icons/toolbar/zoom.svg');
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
    );
  }

  String get path => _assetName;
}
