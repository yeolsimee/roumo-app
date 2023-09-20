import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          Intl.message('helloWorld'),
          // AppLocalizations.of(context).translate('splash'),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      )
    );
  }
}
