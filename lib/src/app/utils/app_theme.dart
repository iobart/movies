import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components_app_theme.dart';

class AppTheme {
  static ThemeData dark() {
    final ThemeData theme = ThemeData(
      fontFamily: 'Gilroy',
      primaryColor: ComponentsAppTheme.yellowColor,
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 72.0,
            fontWeight: FontWeight.bold,
            color: ComponentsAppTheme.whiteColor),
        headline6:
            TextStyle(fontSize: 36.0, color: ComponentsAppTheme.whiteColor),
        headline4:
            TextStyle(fontSize: 24.0, color: ComponentsAppTheme.whiteColor),
        bodyText2:
            TextStyle(fontSize: 14.0, color: ComponentsAppTheme.blackColor),
        bodyText1: TextStyle(
          fontSize: 12.0,
          color: ComponentsAppTheme.whiteColor,
          decoration: TextDecoration.underline,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(

        hintStyle: TextStyle(
          color: ComponentsAppTheme.grayColor,
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ComponentsAppTheme.grayColor)),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ComponentsAppTheme.grayColor),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: ComponentsAppTheme.grayColor),
        ),
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
    );

    return theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(
        primary: ComponentsAppTheme.yellowColor,
        secondary: ComponentsAppTheme.whiteColor,
      ),
    );
  }
}
