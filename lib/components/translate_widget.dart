import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lvivcss_flutter_workshop_nov2019/components/card.dart';
import 'package:lvivcss_flutter_workshop_nov2019/models/languages/language.dart';
import 'package:lvivcss_flutter_workshop_nov2019/models/languages/language_response.dart';
import 'package:lvivcss_flutter_workshop_nov2019/models/translation_request.dart';

import 'language_dropdown.dart';

Language detectLanguage = Language(language: "auto", name: "Detect");

Future<LanguagesResponse> getLanguages() async {
  var dio = Dio();
  Response response = await dio.get(
      "https://translation.googleapis.com/language/translate/v2/languages?key=AIzaSyAqnBxr-G5811raZcYmWODowYofAnd6TjU&target=en");

  return LanguagesResponse.fromJsonMap(response.data["data"]);
}

class TranslateWidget extends StatefulWidget {
  final Function(TranslationRequest) onChange;

  TranslateWidget({@required this.onChange});

  @override
  _TranslateWidgetState createState() => _TranslateWidgetState();
}

class _TranslateWidgetState extends State<TranslateWidget> {
  LanguagesResponse languagesResponse = LanguagesResponse(languages: []);
  Language from = detectLanguage;
  Language to;
  String text;

  @override
  void initState() {
    super.initState();

    getLanguages().then((LanguagesResponse languages) {
      this.setState(() {
        this.languagesResponse = languages;
        this.from = detectLanguage;
        this.to = this.languagesResponse.languages[0];
      });
    });
  }

  void onChange() {
    this.widget.onChange(TranslationRequest(this.from, this.to, this.text));
  }

  @override
  Widget build(BuildContext context) {
    List<Language> autoDetect = [
      detectLanguage,
      ...this.languagesResponse.languages
    ];

    return CardWidget(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: LanguageDropdown(
                  languages: autoDetect,
                  onChange: (Language value) {
                    this.setState(() {
                      this.from = value;
                    });

                    this.onChange();
                  },
                  selected: this.from,
                ),
              ),
              InkWell(
                onTap: () {
                  if (this.from.name != detectLanguage.name) {
                    this.setState(() {
                      var tmp = this.from;
                      this.from = this.to;
                      this.to = tmp;
                    });

                    this.onChange();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.swap_horiz),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: LanguageDropdown(
                  languages: this.languagesResponse.languages,
                  onChange: (Language value) {
                    this.setState(() {
                      this.to = value;
                    });
                    this.onChange();
                  },
                  selected: this.to,
                ),
              ),
            ],
          ),
          TextFormField(
            onChanged: (String value) {
              this.setState(() {
                this.text = value;
              });

              this.onChange();
            },
          ),
        ],
      ),
    );
  }
}
