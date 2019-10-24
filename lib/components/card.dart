import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final Widget child;

  CardWidget({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: this.child,
        ),
      ),
    );
  }
}
