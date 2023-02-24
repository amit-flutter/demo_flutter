import 'package:flutter/material.dart';
import 'package:demo_flutter/controller/utils/constant/colors.dart';

//All constant style are define in style const class.
class StyleConst {
  //TextFieldBorder
  static OutlineInputBorder outLineBorderStyle = OutlineInputBorder(
    borderSide: const BorderSide(color: ThemeConst.kHighLight3DeepBlue, width: 2),
    borderRadius: BorderRadius.circular(10),
  );

  //TextStyle
  static const TextStyle kBlack18Normal = TextStyle(color: ThemeConst.kHighLight3Black, fontSize: 18);
  static const TextStyle kBlack18Bold =
      TextStyle(color: ThemeConst.kHighLight3Black, fontSize: 18, fontWeight: FontWeight.bold);
  static const TextStyle kHintText = TextStyle(color: ThemeConst.kHighLight4DarkGray);

  static const TextStyle kTeal18Normal = TextStyle(color: ThemeConst.kHighLight1, fontSize: 18);
  static const TextStyle kTeal18Bold =
      TextStyle(color: ThemeConst.kHighLight1, fontSize: 18, fontWeight: FontWeight.bold);

  static const TextStyle kHighLight1Normal = TextStyle(color: ThemeConst.kHighLight1, fontSize: 18);
  static const TextStyle kDeepBlue18Bold =
      TextStyle(color: ThemeConst.kHighLight1, fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1.2);
}
