//SizeConst class will contain all common const size used in app.
import 'package:flutter/cupertino.dart';

class SizeConst {
  static const double kDefaultPadding = 20;
  static const double kDefaultRadius = 20;
  static const double kScaffoldPadding = 7;
  static const double kText24 = 24;
  static const double kText20 = 20;
  static const double kText16 = 16;
  static padding({double paddingMultipler = 1}) => EdgeInsets.all(10 * paddingMultipler);
}
