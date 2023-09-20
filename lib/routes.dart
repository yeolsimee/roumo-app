import 'package:roumo_flutter/screens/agreement/agreement_screen.dart';
import 'package:roumo_flutter/screens/home/home_screen.dart';
import 'package:roumo_flutter/screens/login/email_login_screen.dart';
import 'package:roumo_flutter/screens/login/login_screen.dart';
import 'package:roumo_flutter/screens/routine/routine_add_screen.dart';
import 'package:roumo_flutter/screens/routine/routine_update_screen.dart';
import 'package:roumo_flutter/screens/splash/splash_screen.dart';

class Routes {
  static const splash = '/splash';
  static const login = '/login';
  static const emailLogin = '/email_login';
  static const agreement = '/agreement';
  static const home = '/home';
  static const routine = '/routine';
  static const routineAdd = '/routine_add';
  static const routineUpdate = '/routine_update';

  static var routes = {
    splash: (context) => const SplashScreen(),
    login: (context) => const LoginScreen(),
    emailLogin: (context) => const EmailLoginScreen(),
    agreement: (context) => const AgreementScreen(),
    home: (context) => const HomeScreen(),
    routineAdd: (context) => const RoutineAddScreen(),
    routineUpdate: (context) => const RoutineUpdateScreen(),
  };
}
