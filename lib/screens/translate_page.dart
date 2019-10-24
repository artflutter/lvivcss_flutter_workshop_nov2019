import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lvivcss_flutter_workshop_nov2019/models/languages/language_response.dart';

Future<LanguagesResponse> getLanguages() async {
  var dio = Dio();
  Response response = await dio.get(
      "https://translation.googleapis.com/language/translate/v2/languages?key=AIzaSyAqnBxr-G5811raZcYmWODowYofAnd6TjU&target=en");

  return LanguagesResponse.fromJsonMap(response.data["data"]);
}

class TranslatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getLanguages();

    return Container();
  }
}
