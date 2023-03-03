import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:demo_flutter/utils/constant/colors.dart';
import 'package:demo_flutter/utils/constant/sizes.dart';

//Widget const class define pre-define (default) widget used in app.
class WidgetConst {
  static BorderRadius defaultBorderRadius = BorderRadius.circular(SizeConst.kDefaultRadius);
  static const TextStyle highLight1White20 = TextStyle(fontSize: 20, color: ThemeConst.kLightBackGround);

  static const TextStyle highLight1Bold20 =
      TextStyle(fontSize: 20, color: ThemeConst.kHighLight1, fontWeight: FontWeight.bold);
  static const TextStyle highLight1Bold18 =
      TextStyle(fontSize: 18, color: ThemeConst.kHighLight1, fontWeight: FontWeight.bold);
  static const TextStyle highLight1Bold16 = TextStyle(fontSize: 16, color: ThemeConst.kHighLight2Black);

  static const TextStyle kHighLight2Bold16 = TextStyle(fontSize: 16, color: ThemeConst.kHighLight2White);

  static SizedBox kHeightSpacer({double heightMultiplier = 1}) {
    return SizedBox(height: SizeConst.kDefaultPadding * heightMultiplier);
  }

  static SizedBox kWidthSpacer({double widthMultiplier = 1}) {
    return SizedBox(width: SizeConst.kDefaultPadding * widthMultiplier);
  }

  static Text kDefaultText({
    required String textString,
    TextStyle textStyle = highLight1Bold16,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.center,
  }) =>
      Text(
        textString,
        style: textStyle,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLine,
        textAlign: textAlign,
      );

  static Text kButtonText({
    required String textString,
    TextStyle textStyle = highLight1White20,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.center,
  }) =>
      Text(
        textString,
        style: textStyle,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLine,
        textAlign: textAlign,
      );

  static SnackbarController kSnackBar(
          {required String title,
          required String subTitle,
          position = SnackPosition.BOTTOM,
          color = ThemeConst.kDarkBackGround}) =>
      Get.snackbar(
        title,
        subTitle,
        snackPosition: position,
        margin: const EdgeInsets.all(20),
        snackStyle: SnackStyle.FLOATING,
        backgroundColor: color,
        maxWidth: 400,
        padding: const EdgeInsets.all(20),
      );

  static Duration duration() => const Duration(milliseconds: 100);
}
