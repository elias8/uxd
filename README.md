# UXD

[![codecov](https://codecov.io/gh/Elias8/UXD/branch/main/graph/badge.svg?token=hl5feg6dAk)](https://codecov.io/gh/Elias8/UXD)

A User Experience Design tool built with flutter.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials, samples, guidance on mobile development, and a
full API reference.

---

## Working with Translations

This project relies on [flutter_localizations][flutter_localizations_link] and follows
the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. To add a new localized string, open the `app_en.arb` file at `lib/config/l10n/arb/app_en.arb`.

```arb
{
  "@@locale": "en",
  "appName": "UXD",
  "@appName": {
    "description": "The application name"
  }
}
```

2. Then add a new key/value and description

```arb
{
  "@@locale": "en",
  "appName": "UXD",
  "@appName": {
    "description": "The application name"
  },
  "toolbar": "Toolbar",
  "@albums": {
    "description": "Text shown on the toolbar widget"
  },
}
```

3. Use the new string

```dart
import 'package:uxd/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.albums);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `macos/Runner/Info.plist` to include the new locale.

```xml
    ...

<key>CFBundleLocalizations</key>
<array>
<string>en</string>
<string>am</string>
</array>

        ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_am.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
  "@@locale": "en",
  "appName": "UXD",
  "@appName": {
    "description": "The application name"
  },
}
```

`app_am.arb`

```arb
{
  "@@locale": "am",
  "appName": "UXD",
  "@appName": {
    "description": "የመተግበሪያ ስም"
  },
}
```

[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html

[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization

[lcov_link]: https://github.com/linux-test-project/lcov
