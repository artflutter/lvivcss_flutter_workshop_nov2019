import 'package:crypted_preferences/crypted_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:lvivcss_flutter_workshop_nov2019/models/languages/language.dart';

class TranslationEntity with WithPreferencesSerializable {
  final Language from;
  final Language to;
  final String detected;
  final String source;
  final String translation;

  TranslationEntity(
      {@required this.source,
      @required this.translation,
      @required this.from,
      @required this.to,
      @required this.detected});

  static TranslationEntity fromMap(Map<String, Object> data) {
    return TranslationEntity(
        source: data['source'],
        translation: data['translation'],
        from: Language.fromJsonMap(data['from']),
        to: Language.fromJsonMap(data['to']),
        detected: data['detected']);
  }

  @override
  Map<String, Object> toMap() {
    return {
      'source': source,
      'translation': translation,
      'detected': detected,
      'from': from.toJson(),
      'to': to.toJson(),
    };
  }
}
