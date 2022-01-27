// coverage:ignore-file
// ignore_for_file: public_member_api_docs
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

// NOTE:
// Never import this library directly in the application. The PlatformIs
// class and library uses conditional imports to only import this file on
// Web platform builds.

final html.Navigator _nav = html.window.navigator;

// UniversalPlatform for Flutter WEB build.
//
// We can use dart:html Navigator to get the current platform.
bool _hasMatch(String? value, String pattern) {
  return value != null && RegExp(pattern).hasMatch(value);
}

class UniversalPlatform {
  static bool get android => _nav.appVersion.contains('Android ');

  static bool get fuchsia => false;

  static bool get iOS {
    // maxTouchPoints is needed to separate iPad iOS13 vs new MacOS
    return _hasMatch(_nav.platform, '/iPad|iPhone|iPod/') ||
        (_nav.platform == 'MacIntel' && _nav.maxTouchPoints! > 1);
  }

  static bool get linux =>
      (_nav.appVersion.contains('Linux') || _nav.appVersion.contains('x11')) &&
      !android;

  static bool get macOS => _nav.appVersion.contains('Mac OS') && !iOS;

  // Source: https://developer.chrome.com/multidevice/user-agent
  static bool get web => true;

  static bool get windows => _nav.appVersion.contains('Win');

  // Theoretically we could be in a Web browser on Fuchsia too, but
  // we have no info on how to get that info yet, so we return false.
  const UniversalPlatform._();
}
