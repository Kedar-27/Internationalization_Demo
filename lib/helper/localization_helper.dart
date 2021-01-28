import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LocalizationHelper {
  LocalizationHelper(this.locale, this.config);

  final Locale locale;
  final String config;
  static LocalizationHelper of(BuildContext context) {
    return Localizations.of<LocalizationHelper>(context, LocalizationHelper);
  }

  Map<String, String> _localizedValues;

  Future<void> load() async {
    String jsonStringValues =
    await rootBundle.loadString('assets/languages/${locale.languageCode}_${config.toLowerCase().replaceAll(" ", "")}.json');
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    _localizedValues =
        mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String translate(String key) {
    return _localizedValues[key];
  }

  // static member to have simple access to the delegate from Material App
  // static const LocalizationsDelegate<LocalizationHelper> delegate =
  // _LocalizationHelperDelegate();
}

// class _LocalizationHelperDelegate
//     extends LocalizationsDelegate<LocalizationHelper> {
//   const _LocalizationHelperDelegate();
//
//   @override
//   bool isSupported(Locale locale) {
//     return ['en', 'fa', 'ar', 'hi'].contains(locale.languageCode);
//   }
//
//   @override
//   Future<LocalizationHelper> load(Locale locale) async {
//     LocalizationHelper localization = new LocalizationHelper(locale, "config1");
//     await localization.load();
//     return localization;
//   }
//
//   @override
//   bool shouldReload(LocalizationsDelegate<LocalizationHelper> old) => false;
// }

String getTranslated(BuildContext context, String key) {
  return LocalizationHelper.of(context).translate(key);
}