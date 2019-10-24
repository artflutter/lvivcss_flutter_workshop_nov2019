import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lvivcss_flutter_workshop_nov2019/components/card_empty.dart';
import 'package:lvivcss_flutter_workshop_nov2019/components/card_favorite.dart';
import 'package:lvivcss_flutter_workshop_nov2019/components/translate_widget.dart';
import 'package:lvivcss_flutter_workshop_nov2019/components/translation_widget.dart';
import 'package:lvivcss_flutter_workshop_nov2019/models/translation_entity.dart';
import 'package:lvivcss_flutter_workshop_nov2019/models/translation_request.dart';

import '../models/translations/translation.dart';
import '../models/translations/translation_response.dart';

class TranslatePage extends StatefulWidget {
  @override
  _TranslatePageState createState() => _TranslatePageState();
}

Future<TranslationResponse> getTranslation(TranslationRequest translate) async {
  var dio = Dio();

  final q = translate.text;
  final target = translate.to.language;
  final source = translate.from.language != "auto"
      ? '&source=${translate.from.language}'
      : '';

  Response response = await dio.get(
      "https://translation.googleapis.com/language/translate/v2?key=AIzaSyAqnBxr-G5811raZcYmWODowYofAnd6TjU&q=$q&target=$target$source");

  return TranslationResponse.fromJsonMap(response.data["data"]);
}

class _TranslatePageState extends State<TranslatePage> {
  TranslationRequest translate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TranslateWidget(
          onChange: (TranslationRequest value) {
            this.setState(() {
              this.translate = value;
            });
          },
        ),
        Text(
          'Translations',
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
        FutureBuilder<TranslationResponse>(
          future: this.translate != null && this.translate.text != null
              ? getTranslation(this.translate)
              : null,
          builder: (BuildContext context,
              AsyncSnapshot<TranslationResponse> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return CardEmpty();
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Container();
              case ConnectionState.done:
                if (snapshot.hasError) return Text('Error: ${snapshot.error}');

                return Column(
                  children: snapshot.data.translations.map((Translation value) {
                    final translation = TranslationEntity(
                        source: this.translate.text,
                        translation: value.translatedText,
                        from: this.translate.from,
                        to: this.translate.to,
                        detected: value.detectedSourceLanguage);

                    List detected = [];
                    if (value.detectedSourceLanguage != null) {
                      detected.add(SizedBox(height: 5));
                      detected.add(Text(
                        'Detected language: ${value.detectedSourceLanguage}',
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ));
                    }

                    return CardFavorite(
                      translation: translation,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TranslationWidget(
                            translation: translation,
                          ),
                          ...detected,
                        ],
                      ),
                    );
                  }).toList(),
                );
            }

            return Container();
          },
        )
      ],
    );
  }
}
