import 'package:flutter/cupertino.dart';

import 'language.dart';

class LanguagesResponse {
  List<Language> languages;

  LanguagesResponse({@required this.languages});

  LanguagesResponse.fromJsonMap(Map<String, dynamic> map)
      : languages = List<Language>.from(
            map["languages"].map((it) => Language.fromJsonMap(it)));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['languages'] = languages != null
        ? this.languages.map((v) => v.toJson()).toList()
        : null;
    return data;
  }
}
