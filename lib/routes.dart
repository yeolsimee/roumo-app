import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
  static const _emailLogin = 'email_login';

  static const agreement = '/agreement';
  static const _agreement = 'agreement';

  static const home = '/home';

  static const routineAdd = '/routine_add';
  static const _routineAdd = 'routine_add';
  static const routineUpdate = '/routine_update';
  static const _routineUpdate = 'routine_update';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: Routes.login,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: Routes._agreement,
            builder: (BuildContext context, GoRouterState state) {
              return const AgreementScreen();
            },
          ),
          GoRoute(
            path: Routes._emailLogin,
            builder: (BuildContext context, GoRouterState state) {
              return const EmailLoginScreen();
            },
          ),
        ],
      ),
      GoRoute(
        path: Routes.home,
        builder: (context, state) {
          return const HomeScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: Routes._routineAdd,
            builder: (context, state) {
              return const RoutineAddScreen();
            },
          ),
          GoRoute(
            path: Routes._routineUpdate,
            builder: (context, state) {
              return const RoutineUpdateScreen();
            },
          ),
        ],
      ),
    ],
  );

}

