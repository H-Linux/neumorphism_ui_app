import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'page/splash/splash_page.dart';

import 'router_page.dart';
import 'utils/tools.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neumorphism UI',
      navigatorKey: navGK,
      theme: ThemeData(primaryColor: SetColor.myBackgroundColor),
      home: SplashPage(),
      routes: <String, WidgetBuilder>{
        'RouterPage': (BuildContext context) => RouterPage(),
      },
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('zh', ''),
        ...S.delegate.supportedLocales,
      ],
      localeListResolutionCallback: (locales, supportedLocales) {
        print(locales);
        return;
      },
    );
  }
}
