import 'package:crypted_preferences/crypted_preferences.dart';
import 'package:lvivcss_flutter_workshop_nov2019/models/translation_entity.dart';

class TranslationPref with WithPreferencesSerializable {
  final List<TranslationEntity> translationList;

  TranslationPref(this.translationList);

  add(TranslationEntity translationEntity) {
    this.translationList.add(translationEntity);
  }

  remove(TranslationEntity translationEntity) {
    this.translationList.removeWhere((item) =>
        item.translation == translationEntity.translation &&
        item.source == translationEntity.source);
  }

  static TranslationPref fromMap(Map<String, dynamic> data) {
    return TranslationPref(data['translationList'].map<TranslationEntity>(
      (translation) {
        var f = TranslationEntity.fromMap(translation);
        return f;
      },
    ).toList());
  }

  @override
  Map<String, List<Map<String, Object>>> toMap() {
    return {
      'translationList':
          translationList.map((translation) => translation.toMap()).toList()
    };
  }
}
