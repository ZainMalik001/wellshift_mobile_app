import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:well_shift_app/core/common/app_colors.dart';
import 'package:well_shift_app/core/common/app_localization.dart';
import 'package:well_shift_app/presentation/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'Poppins', primarySwatch: AppColors.prim),
      locale: Locale('en', "GB"),
      supportedLocales: [
        const Locale('en', 'GB'),
        const Locale('es', 'ES'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        return Locale('en', 'GB');
      },
      /// Whenever the app is opened [SplashPage] is called
      /// for 3 seconds and then it is redirected to intro page
      home:SplashPage(),
    );
  }
}
