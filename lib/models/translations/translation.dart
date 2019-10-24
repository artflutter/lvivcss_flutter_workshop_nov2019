import 'package:flutter/cupertino.dart';

class Translation {
  String detectedSourceLanguage;
  String translatedText;

  Translation(
      {@required this.detectedSourceLanguage, @required this.translatedText});

  Translation.fromJsonMap(Map<String, dynamic> map)
      : detectedSourceLanguage = map["detectedSourceLanguage"],
        translatedText = map["translatedText"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['detectedSourceLanguage'] = detectedSourceLanguage;
    data['translatedText'] = translatedText;
    return data;
  }
}
