import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Button extends StatelessWidget {
  final _text;
  final _callback;
  Button(this._text, this._callback);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: OutlinedButton(
          onPressed: _callback,
          child: Center(
              child: Text(_text, style: Theme.of(context).textTheme.button))),
    );
  }
}
