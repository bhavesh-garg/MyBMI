import 'package:flutter/material.dart';

class ReuseContainer extends StatelessWidget {
  final Color mecolor;
  final Widget cardWidget;
  ReuseContainer({@required this.mecolor, this.cardWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardWidget,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: mecolor,
      ),
    );
  }
}
