import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/router/router.dart';
import '../../style/colors.dart';
/* l10n */
import 'l10n/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /* This widget is the root of your application. */
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: pageRouter,
      debugShowCheckedModeBanner: false,
      /* title: 'Flutter Demo', */
      theme: ThemeData.dark().copyWith(
        // colorScheme: ColorScheme.fromSeed(seedColor: txtBlackColor),
        // useMaterial3: true,
        /*  fontFamily: GoogleFonts.quicksand().fontFamily, */
        textTheme: GoogleFonts.latoTextTheme(),
        // home: const AuthPage(),
      ),
      supportedLocales: L10n.all,
      locale: const Locale('en'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
    );
  }
}
