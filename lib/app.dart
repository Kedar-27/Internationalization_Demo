import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './pages/welcome_page.dart';
import 'flavors.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("en", "US"),
        Locale("ar", ""), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      title: F.title,
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomePage(),

    );
  }
}
