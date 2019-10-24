import 'package:flutter/material.dart';

import '../models/languages/language.dart';

class LanguageDropdown extends StatelessWidget {
  final Language selected;
  final List<Language> languages;
  final ValueChanged<Language> onChange;

  LanguageDropdown(
      {@required this.languages,
      @required this.onChange,
      @required this.selected});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Language>(
      isExpanded: true,
      value: this.selected,
      items: this.languages.map((Language value) {
        return DropdownMenuItem<Language>(
          value: value,
          child: new Text(value.name),
        );
      }).toList(),
      onChanged: (Language value) {
        this.onChange(value);
      },
    );
  }
}
