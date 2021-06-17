import 'package:cdp/theme/theme.dart';
import 'package:cdp/views/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Le Café de Paris',
        theme: basicTheme(),
        home: Home());
  }
}
