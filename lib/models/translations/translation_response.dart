import 'package:flutter/cupertino.dart';
import 'package:lvivcss_flutter_workshop_nov2019/models/translations/translation.dart';

class TranslationResponse {
  List<Translation> translations;

  TranslationResponse({@required this.translations});

  TranslationResponse.fromJsonMap(Map<String, dynamic> map)
      : translations = List<Translation>.from(
            map["translations"].map((it) => Translation.fromJsonMap(it)));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['translations'] = translations != null
        ? this.translations.map((v) => v.toJson()).toList()
        : null;
    return data;
  }
}
