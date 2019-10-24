import 'package:flutter/material.dart';
import 'package:lvivcss_flutter_workshop_nov2019/components/card_empty.dart';
import 'package:lvivcss_flutter_workshop_nov2019/components/card_error.dart';
import 'package:lvivcss_flutter_workshop_nov2019/components/card_favorite.dart';
import 'package:lvivcss_flutter_workshop_nov2019/components/translation_widget.dart';
import 'package:lvivcss_flutter_workshop_nov2019/models/translation_pref.dart';

import '../prefs.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TranslationPref>(
      future: translationPrefRead(),
      builder: (BuildContext context, AsyncSnapshot<TranslationPref> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return CardEmpty();
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Container();
          case ConnectionState.done:
            if (snapshot.hasError) {
              return CardError();
            }

            if (snapshot.data != null) {
              if (snapshot.data.translationList.length == 0) {
                return CardEmpty();
              }

              return ListView.builder(
                itemCount: snapshot.data.translationList.length,
                itemBuilder: (context, index) {
                  return CardFavorite(
                    translation: snapshot.data.translationList[index],
                    child: TranslationWidget(
                        translation: snapshot.data.translationList[index]),
                    saved: true,
                  );
                },
              );
            }
        }

        return Container();
      },
    );
  }
}
