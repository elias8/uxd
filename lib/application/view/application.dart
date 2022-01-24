import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../design/design.dart';
import '../../l10n/l10n.dart';

/// {@template application}
/// An entry widget to the application.
/// {@endtemplate}
class Application extends StatelessWidget {
  /// {@macro application}
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const DesignPage(),
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => context.l10n.appName,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0XFFE4E4E4),
        tooltipTheme: TooltipThemeData(
          verticalOffset: 16,
          waitDuration: const Duration(milliseconds: 1000),
          textStyle: const TextStyle(
            fontSize: 11,
            color: Color(0xFF616161),
            fontWeight: FontWeight.w400,
          ),
          decoration: BoxDecoration(
            color: const Color(0XFFE4E4E4),
            borderRadius: BorderRadius.circular(2),
            border: Border.all(color: Colors.grey.shade400, width: .7),
          ),
        ),
      ),
    );
  }
}
