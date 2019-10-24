import 'package:flutter/material.dart';
import 'package:lvivcss_flutter_workshop_nov2019/models/translation_entity.dart';

class TranslationWidget extends StatelessWidget {
  final TranslationEntity translation;

  TranslationWidget({@required this.translation});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(this.translation.source, style: TextStyle(fontSize: 13)),
        SizedBox(height: 10),
        Text(
          this.translation.translation,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
