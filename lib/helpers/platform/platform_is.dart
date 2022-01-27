// coverage:ignore-file
// ignore_for_file: public_member_api_docs

import 'universal_platform_web.dart'
    if (dart.library.io) 'universal_platform_vm.dart';

// This following implementation is borrowed from https://gist.github.com/rydmike/1771fe24c050ebfe792fa309371154d8
// by @rydmike with MIT license.

/// A universal platform checker.
///
/// Can be used to check active physical Flutter platform on all platforms.
///
/// To check what host platform the app is running on use:
///
/// * pIsAndroid
/// * pIsiOS
/// * pIsMacOS
/// * pIsWindows
/// * pIsLinux
/// * pIsFuchsia
///
/// To check the device type use:
///
/// * pMobile  (Android or iOS)
/// * pDesktop (Windows, macOS or Linux)
///
/// Currently Fuchsia is not considered mobile nor desktop, even if it
/// might be so in the future.
///
/// To check if the Flutter application is running on Web you can use:
///
/// * pIsWeb
///
/// Alternatively the Flutter foundation compile time constant kIsWeb also
/// works well for that.
///
/// The platform checks are supported independently on web. You can use
/// pIsWindows, pIsiOS, pIsMacOS, pIsAndroid and pIsLinux to check what the host
/// platform is when you are running a Flutter Web application.
///
/// Checking if we are running on a Fuchsia host in a Web browser, is not yet
/// fully supported. If running in a Web browser on Fuchsia, pIsWeb will
/// be true, but pIsFuchsia will be false. Future versions, when Fuchsia
/// is released, may fix this.
final pIsAndroid = UniversalPlatform.android;
final pIsApple = pIsiOS || pIsMacOS;
final pIsDesktop = pIsMacOS || pIsWindows || pIsLinux;
final pIsFuchsia = UniversalPlatform.fuchsia;
final pIsiOS = UniversalPlatform.iOS;
final pIsLinux = UniversalPlatform.linux;
final pIsMacOS = UniversalPlatform.macOS;
final pIsMobile = pIsiOS || pIsAndroid;
final pIsWeb = UniversalPlatform.web;
final pIsWindows = UniversalPlatform.windows;
