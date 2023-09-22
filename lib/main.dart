import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roumo_flutter/gen/fonts.gen.dart';
import 'package:roumo_flutter/generated/l10n.dart';
import 'package:roumo_flutter/routes.dart';
import 'package:roumo_flutter/screens/login/login_screen.dart';
import 'package:roumo_flutter/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      ensureScreenSize: true,
      child: MaterialApp(
        title: 'ROUMO',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: FontFamily.pretendard,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: const Locale('ko', 'KR'),
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ko', 'KR'),
        ],
        home: Navigator(
          onGenerateInitialRoutes: (navigator, initialRoute) => [
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          ],
          initialRoute: Routes.login,
          pages: Routes.pages,
          onPopPage: (route, result) => route.didPop(result),
        ),
      ),
    );
  }
}
