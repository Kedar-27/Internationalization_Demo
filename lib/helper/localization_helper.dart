import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LocalizationHelper {
  LocalizationHelper(this.locale, this.config);

  final Locale locale;
  final String config;


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


}


