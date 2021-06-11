import 'package:flutter/material.dart';

ThemeData basicTheme() {
  final darkBackground = Color(0xff292929);
  final textColor = Color(0xffe5e5e5);

  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
        button: base.button!
            .copyWith(fontFamily: 'Roboto', fontSize: 16, color: textColor),
        headline1: base.headline1!.copyWith(
            fontFamily: 'NothingYouCouldDo', fontSize: 60, color: textColor),
        headline2: base.headline2!
            .copyWith(fontFamily: 'Roboto', fontSize: 20, color: textColor),
        headline3: base.headline3!.copyWith(
            fontFamily: 'NothingYouCouldDo', fontSize: 18, color: textColor),
        bodyText1: base.bodyText1!
            .copyWith(fontFamily: 'Roboto', fontSize: 14, color: textColor),
        bodyText2: base.bodyText2!
            .copyWith(fontFamily: 'Roboto', fontSize: 14, color: textColor));
  }

  final ThemeData base = ThemeData();
  return base.copyWith(
      textTheme: _basicTextTheme(base.textTheme),
      scaffoldBackgroundColor: darkBackground,
      textButtonTheme:
          TextButtonThemeData(style: TextButton.styleFrom(primary: textColor)),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              padding: EdgeInsets.all(25.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0))),
              primary: textColor,
              side: BorderSide(width: 1, color: textColor))));
}
