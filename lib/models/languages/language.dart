import 'package:flutter/cupertino.dart';

class Language {
  String language;
  String name;

  Language({@required this.language, @required this.name});

  Language.fromJsonMap(Map<String, dynamic> map)
      : language = map["language"],
        name = map["name"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['language'] = language;
    data['name'] = name;
    return data;
  }
}
