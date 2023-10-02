import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roumo_flutter/screens/agreement/agreement_screen.dart';
import 'package:roumo_flutter/screens/login/email_login_screen.dart';
import 'package:roumo_flutter/screens/login/login_screen.dart';
import 'package:roumo_flutter/screens/main/home/home_screen.dart';
import 'package:roumo_flutter/screens/main/main_view.dart';
import 'package:roumo_flutter/screens/main/routine/routine_add_screen.dart';
import 'package:roumo_flutter/screens/main/routine/routine_update_screen.dart';
import 'package:roumo_flutter/screens/splash/splash_screen.dart';

class Routes {
  static const splash = '/splash';
  static const login = '/login';

  static const emailLogin = '/login/email_login';
  static const _emailLogin = 'email_login';

  static const agreement = '/login/agreement';
  static const _agreement = 'agreement';

  static const main = '/main';

  static const routineAdd = '/main/routine_add';
  static const _routineAdd = 'routine_add';
  static const routineUpdate = '/main/routine_update';
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
        path: Routes.main,
        builder: (context, state) {
          return const MainView();
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

