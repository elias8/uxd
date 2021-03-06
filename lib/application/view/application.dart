import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../design/design.dart';
import '../../l10n/l10n.dart';

/// {@template application}
/// An entry widget to the application.
/// {@endtemplate}
class Application extends StatelessWidget {
  /// {@macro application}
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      home: const DesignPage(),
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => context.l10n.appName,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
    );
  }
}

/// Contains the app theme data.
class AppTheme {
  /// A default light theme of the app.
  static ThemeData get light {
    const inputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    );
    return ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: Colors.white,
      brightness: Brightness.light,
      textTheme: GoogleFonts.ptSansTextTheme(),
      scaffoldBackgroundColor: const Color(0XFFE4E4E4),
      tabBarTheme: TabBarTheme(
        labelStyle: GoogleFonts.ptSans(),
        indicatorSize: TabBarIndicatorSize.label,
        unselectedLabelStyle: GoogleFonts.ptSans(),
        unselectedLabelColor: const Color(0XFF919191),
        labelPadding: const EdgeInsets.symmetric(horizontal: 10),
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(
            color: Color(0XFF616161),
            width: 2.5,
          ),
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        elevation: 1,
        color: const Color(0XFFEDEDED),
        textStyle: GoogleFonts.ptSans(
          color: Colors.grey.shade800,
          fontSize: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Colors.grey.shade400, width: .5),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        suffixIconColor: Colors.grey,
        focusedBorder: inputBorder,
        border: inputBorder,
        isDense: true,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.black,
      ),
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
    );
  }
}
