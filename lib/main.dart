import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roumo_flutter/gen/fonts.gen.dart';
import 'package:roumo_flutter/generated/l10n.dart';
import 'package:roumo_flutter/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
    ),
  );
  await Firebase.initializeApp();
  runApp(
    ProviderScope(
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        ensureScreenSize: true,
        child: MaterialApp.router(
          routerConfig: Routes.router,
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
        ),
      ),
    ),
  );
}
