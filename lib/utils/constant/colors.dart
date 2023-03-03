import 'package:flutter/material.dart';
import 'package:demo_flutter/utils/constant/style.dart';

//ThemeConst class will contain all color and theme info.
class ThemeConst {
  static const Color kDarkBackGround = Color.fromRGBO(55, 58, 69, 1);
  static const Color kLightBackGround = Color.fromRGBO(241, 241, 241, 1);

  static const Color kHighLight1 = Color(0xFF60A053);
  static const Color kHighLight2 = Color(0xfaffffff);
  static const Color kHighLight3 = Color(0xFF529344);
  static const Color kHighLight2Black = Colors.black;
  static const Color kHighLight3DeepBlue = Color.fromRGBO(35, 60, 91, 1);

  static const Color kRed = Colors.red;
  static const Color kGreen = Colors.green;
  static const Color kYellow = Colors.yellow;

  static const Color kHighLight2White = Colors.white;
  static const Color kHighLight3Black = Color.fromRGBO(0, 0, 0, 1);
  static const Color kHighLight4DarkGray = Color.fromRGBO(137, 145, 173, 1);
  static const Color kHighLight5LightBlue = Color.fromRGBO(160, 174, 225, 1);

  //Light Theme data is define here
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: kLightBackGround,

    radioTheme: RadioThemeData(fillColor: MaterialStateColor.resolveWith((states) => kHighLight1)),

    inputDecorationTheme: InputDecorationTheme(
      alignLabelWithHint: true,
      focusColor: kHighLight1,
      contentPadding: const EdgeInsets.only(left: 20),
      labelStyle: StyleConst.kBlack18Normal,
      suffixIconColor: kHighLight1,
      border: StyleConst.outLineBorderStyle,
      enabledBorder: StyleConst.outLineBorderStyle,
      errorBorder: StyleConst.outLineBorderStyle.copyWith(
        borderSide: const BorderSide(color: kRed, width: 2),
      ),
      focusedBorder: StyleConst.outLineBorderStyle.copyWith(
        borderSide: const BorderSide(color: kHighLight1, width: 2),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: kHighLight1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        textStyle: StyleConst.kTeal18Bold,
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(cursorColor: kHighLight1, selectionColor: kHighLight1.withOpacity(0.3)),

    primaryColor: kHighLight1,
    cardColor: kHighLight2White,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: kHighLight1, size: 30),
      backgroundColor: ThemeConst.kHighLight1,
      elevation: 0,
      centerTitle: true,
    ),
    listTileTheme: const ListTileThemeData(iconColor: kHighLight3Black),
    iconTheme: const IconThemeData(color: kHighLight1, size: 30),
    colorScheme: ColorScheme.light(
      secondary: kHighLight5LightBlue.withOpacity(0.7),
      brightness: Brightness.light,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: kHighLight1,
      ),
    ),

    // useMaterial3: true,
  );

  //Light and Dark mode right now same you can change as per new UI.
  static ThemeData darkTheme = ThemeData(
    //New
    scaffoldBackgroundColor: kLightBackGround,
    radioTheme: RadioThemeData(fillColor: MaterialStateColor.resolveWith((states) => kHighLight1)),

    inputDecorationTheme: InputDecorationTheme(
      alignLabelWithHint: true,
      focusColor: kHighLight1,
      contentPadding: const EdgeInsets.only(left: 20),
      labelStyle: StyleConst.kBlack18Normal,
      suffixIconColor: kHighLight1,
      border: StyleConst.outLineBorderStyle,
      enabledBorder: StyleConst.outLineBorderStyle,
      errorBorder: StyleConst.outLineBorderStyle.copyWith(
        borderSide: const BorderSide(color: kRed, width: 2),
      ),
      focusedBorder: StyleConst.outLineBorderStyle.copyWith(
        borderSide: const BorderSide(color: kHighLight1, width: 2),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: kHighLight1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        textStyle: StyleConst.kTeal18Bold,
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(cursorColor: kHighLight1, selectionColor: kHighLight1.withOpacity(0.3)),

    primaryColor: kHighLight1,
    cardColor: kHighLight2White,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: kHighLight1, size: 30),
      backgroundColor: ThemeConst.kLightBackGround,
      elevation: 0,
      centerTitle: true,
    ),
    iconTheme: const IconThemeData(color: kHighLight1, size: 30),
    colorScheme: ColorScheme.light(
      secondary: kHighLight5LightBlue.withOpacity(0.7),
      brightness: Brightness.light,
    ),

    // useMaterial3: true,
  );
}
