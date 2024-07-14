import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/router/router.dart';
import '../../style/colors.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
        /*  fontFamily: GoogleFonts.quicksand().fontFamily, */
        textTheme: GoogleFonts.poppinsTextTheme(),
        // home: const AuthPage(),
      ),
    );
  }
}
