import 'package:flutter/material.dart';

class CommonUi{
  static Widget grayBorder(BuildContext context) {
    return new Container(
      width: 1.0,
      height: 40.0,
      decoration: new BoxDecoration(
          border: Border(
              left: Divider.createBorderSide(context,
                  color: Colors.black, width: 1.0))),
    );
  }
}