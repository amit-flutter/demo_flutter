import 'package:flutter/material.dart';
import 'package:demo_flutter/utils/constant/colors.dart';

//All constant style are define in style const class.
class StyleConst {
  //TextFieldBorder
  static OutlineInputBorder outLineBorderStyle = OutlineInputBorder(
    borderSide: const BorderSide(color: ThemeConst.kHighLight1, width: 2),
    borderRadius: BorderRadius.circular(10),
  );

  //TextStyle
  static const TextStyle kBlack18Normal = TextStyle(color: ThemeConst.kHighLight3Black, fontSize: 18);

  static const TextStyle kTeal18Normal = TextStyle(color: ThemeConst.kHighLight1, fontSize: 18);
  static const TextStyle kTeal18Bold =
      TextStyle(color: ThemeConst.kHighLight1, fontSize: 18, fontWeight: FontWeight.bold);
  static const TextStyle kHighLight1Normal = TextStyle(color: ThemeConst.kHighLight1, fontSize: 18);


  static const TextStyle kHighLight216 = TextStyle(fontSize: 16, color: ThemeConst.kHighLight2White);
  static const TextStyle kHighLight214 = TextStyle(fontSize: 14, color: ThemeConst.kHighLight2White);
}
