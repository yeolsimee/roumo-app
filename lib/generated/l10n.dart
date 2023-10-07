// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login With Naver`
  String get loginWithNaver {
    return Intl.message(
      'Login With Naver',
      name: 'loginWithNaver',
      desc: '',
      args: [],
    );
  }

  /// `Login With Google`
  String get loginWithGoogle {
    return Intl.message(
      'Login With Google',
      name: 'loginWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Apple`
  String get loginWithApple {
    return Intl.message(
      'Sign in with Apple',
      name: 'loginWithApple',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service`
  String get agreementTitle {
    return Intl.message(
      'Terms of Service',
      name: 'agreementTitle',
      desc: '',
      args: [],
    );
  }

  /// `Agree to all`
  String get agreeAll {
    return Intl.message(
      'Agree to all',
      name: 'agreeAll',
      desc: '',
      args: [],
    );
  }

  /// `Agree to the Service Terms`
  String get agree1 {
    return Intl.message(
      'Agree to the Service Terms',
      name: 'agree1',
      desc: '',
      args: [],
    );
  }

  /// `Agree to the Privacy Policy`
  String get agree2 {
    return Intl.message(
      'Agree to the Privacy Policy',
      name: 'agree2',
      desc: '',
      args: [],
    );
  }

  /// `Agree and Continue`
  String get agreeAndContinue {
    return Intl.message(
      'Agree and Continue',
      name: 'agreeAndContinue',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Recommend`
  String get routineRecommend {
    return Intl.message(
      'Recommend',
      name: 'routineRecommend',
      desc: '',
      args: [],
    );
  }

  /// `My Page`
  String get myPage {
    return Intl.message(
      'My Page',
      name: 'myPage',
      desc: '',
      args: [],
    );
  }

  /// `Notice`
  String get notice {
    return Intl.message(
      'Notice',
      name: 'notice',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service`
  String get terms_of_service {
    return Intl.message(
      'Terms of Service',
      name: 'terms_of_service',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Leave`
  String get memberLeave {
    return Intl.message(
      'Leave',
      name: 'memberLeave',
      desc: '',
      args: [],
    );
  }

  /// `If you leave, all data will be deleted.`
  String get memberLeaveDetail {
    return Intl.message(
      'If you leave, all data will be deleted.',
      name: 'memberLeaveDetail',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get giveUp {
    return Intl.message(
      'Cancel',
      name: 'giveUp',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out?`
  String get logoutMessage {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'logoutMessage',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Plan to update`
  String get plan_to_update {
    return Intl.message(
      'Plan to update',
      name: 'plan_to_update',
      desc: '',
      args: [],
    );
  }

  /// `We are preparing to update the service. Please wait a little longer.`
  String get plan_to_update_detail {
    return Intl.message(
      'We are preparing to update the service. Please wait a little longer.',
      name: 'plan_to_update_detail',
      desc: '',
      args: [],
    );
  }

  /// `Mon`
  String get day_of_week_1 {
    return Intl.message(
      'Mon',
      name: 'day_of_week_1',
      desc: '',
      args: [],
    );
  }

  /// `Tue`
  String get day_of_week_2 {
    return Intl.message(
      'Tue',
      name: 'day_of_week_2',
      desc: '',
      args: [],
    );
  }

  /// `Wed`
  String get day_of_week_3 {
    return Intl.message(
      'Wed',
      name: 'day_of_week_3',
      desc: '',
      args: [],
    );
  }

  /// `Thu`
  String get day_of_week_4 {
    return Intl.message(
      'Thu',
      name: 'day_of_week_4',
      desc: '',
      args: [],
    );
  }

  /// `Fri`
  String get day_of_week_5 {
    return Intl.message(
      'Fri',
      name: 'day_of_week_5',
      desc: '',
      args: [],
    );
  }

  /// `Sat`
  String get day_of_week_6 {
    return Intl.message(
      'Sat',
      name: 'day_of_week_6',
      desc: '',
      args: [],
    );
  }

  /// `Sun`
  String get day_of_week_7 {
    return Intl.message(
      'Sun',
      name: 'day_of_week_7',
      desc: '',
      args: [],
    );
  }

  /// `.`
  String get year {
    return Intl.message(
      '.',
      name: 'year',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get month {
    return Intl.message(
      '',
      name: 'month',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ko'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
