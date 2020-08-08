import 'package:flutter/material.dart';
import 'constant.dart';

class CardWidgetIcon extends StatelessWidget {
  final IconData wicon;
  final String wtext;
  CardWidgetIcon({this.wicon, this.wtext});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          wicon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(wtext, style: klableTextStyle)
      ],
    );
  }
}
