import 'package:flutter/material.dart';
import 'package:lvivcss_flutter_workshop_nov2019/components/card.dart';
import 'package:lvivcss_flutter_workshop_nov2019/models/translation_entity.dart';

class CardFavorite extends StatefulWidget {
  final TranslationEntity translation;
  final Widget child;
  final bool saved;

  CardFavorite(
      {Key key,
      @required this.translation,
      @required this.child,
      this.saved = false})
      : super(key: key);

  @override
  _CardFavoriteState createState() => _CardFavoriteState();
}

class _CardFavoriteState extends State<CardFavorite> {
  bool saved = false;

  @override
  void initState() {
    super.initState();
    this.saved = this.widget.saved;
  }

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              this.widget.child,
              InkWell(
                onTap: () async {
                  this.setState(() {
                    this.saved = !this.saved;
                  });
                },
                child:
                    Icon(this.saved ? Icons.favorite : Icons.favorite_border),
              )
            ],
          )
        ],
      ),
    );
  }
}
