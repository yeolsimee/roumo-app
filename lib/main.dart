import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:roumo_flutter/generated/l10n.dart';
import 'package:roumo_flutter/routes.dart';
import 'package:roumo_flutter/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ROUMO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
      ],
      home: Navigator(
        pages: const [
          MaterialPage(
            key: ValueKey('SplashScreen'),
            child: SplashScreen(),
          ),
        ],
        onPopPage: (route, result) => route.didPop(result),
      ),
    );
  }
}
