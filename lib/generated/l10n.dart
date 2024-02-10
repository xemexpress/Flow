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

  /// `List`
  String get pageHomeNavTodos {
    return Intl.message(
      'List',
      name: 'pageHomeNavTodos',
      desc:
          'Navigation label for accessing the \'List\' section, where members can view and manage their to-do tasks',
      args: [],
    );
  }

  /// `Inventory`
  String get pageHomeNavInventory {
    return Intl.message(
      'Inventory',
      name: 'pageHomeNavInventory',
      desc:
          'Navigation label for accessing the \'Inventory\' section, where users can view and manage inventory items',
      args: [],
    );
  }

  /// `Search`
  String get pageHomeNavSearch {
    return Intl.message(
      'Search',
      name: 'pageHomeNavSearch',
      desc:
          'Navigation label for the search feature, allowing users to quickly find specific products',
      args: [],
    );
  }

  /// `Start`
  String get pageLogInStart {
    return Intl.message(
      'Start',
      name: 'pageLogInStart',
      desc:
          'Button text inviting members to log in and embark on their management experience',
      args: [],
    );
  }

  /// `Email Address`
  String get pageLogInEmail {
    return Intl.message(
      'Email Address',
      name: 'pageLogInEmail',
      desc:
          'Placeholder text indicating where members should enter their username during login',
      args: [],
    );
  }

  /// `Password`
  String get pageLogInPassword {
    return Intl.message(
      'Password',
      name: 'pageLogInPassword',
      desc:
          'Placeholder text indicating where members should enter their password during login',
      args: [],
    );
  }

  /// `What we truly possess is only time.`
  String get helloWorld {
    return Intl.message(
      'What we truly possess is only time.',
      name: 'helloWorld',
      desc: 'The conventional newborn programmer greeting',
      args: [],
    );
  }

  /// `Making management like fish in water`
  String get slogan {
    return Intl.message(
      'Making management like fish in water',
      name: 'slogan',
      desc: 'Company\'s slogan emphasizing effortless management',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
      Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
      Locale.fromSubtags(
          languageCode: 'zh', scriptCode: 'Hans', countryCode: 'CN'),
      Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
      Locale.fromSubtags(
          languageCode: 'zh', scriptCode: 'Hant', countryCode: 'HK'),
      Locale.fromSubtags(
          languageCode: 'zh', scriptCode: 'Hant', countryCode: 'TW'),
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
