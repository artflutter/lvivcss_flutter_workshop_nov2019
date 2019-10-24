import 'languages/language.dart';

class TranslationRequest {
  final Language from;
  final Language to;
  final String text;

  TranslationRequest(this.from, this.to, this.text);
}
