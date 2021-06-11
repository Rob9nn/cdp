import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  final _right, _left;
  Separator(this._right, this._left);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            margin: EdgeInsets.only(left: _left, right: _right),
            child: Divider(color: Color(0xffe5e5e5))));
  }
}
