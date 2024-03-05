import 'package:flutter/material.dart';
import '/style/colors.dart';
import '../../utils/version_info.dart';
// import '../style/colors.dart';

class AppInfoPage extends StatelessWidget {
  const AppInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Locale appLocale = Localizations.localeOf(context);
    final String languageCode = appLocale.languageCode;
    debugPrint('Languade code: $languageCode');
    return Scaffold(
      appBar: AppBar(
        /* iconTheme: const IconThemeData(color: textWhiteColor),
        backgroundColor: primaryColor, */
        title: const Text(
          'App info',
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const VersionInfo(),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            'deviceLanguageCode: $languageCode',
            style: const TextStyle(color: txtWhiteColor),
          )
        ],
      ),
    );
  }
}
