// ignore_for_file: avoid_print

import 'dart:io';

import 'package:demo_flutter/controller/app_common_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_flutter/utils/constant/colors.dart';
import 'package:demo_flutter/utils/constant/sizes.dart';
import 'package:image_picker/image_picker.dart';

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

  static void gallerySelectionSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          print("--------> gallerySelectionSheet");
          return Container(
            color: ThemeConst.kHighLight2White,
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.camera_alt),
                    title: const Text('Take a Photo'),
                    onTap: () async {
                      Navigator.pop(context);
                      WidgetConst().openSystemImagePicker('camera', context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.image),
                    title: const Text('Pick Image from gallery'),
                    onTap: () async {
                      Navigator.pop(context);
                      WidgetConst().openSystemImagePicker('gallery', context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void openSystemImagePicker(photoType, BuildContext context) async {
    String profileImgPath = '';
    final AppCommonController appCommonController = Get.put(AppCommonController());
    print("--------> openSystemImagePicker");

    try {
      final ImagePicker picker = ImagePicker();
      ImageSource source = ImageSource.gallery;
      if (photoType == 'camera') source = ImageSource.camera;

      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        //IF you want to crop image uncomment below and comment remain one
        // profileImgPath = await _cropImage(pickedFile, context);
        profileImgPath = File(pickedFile.path).path;
        print(profileImgPath);
        appCommonController.currentImagePath.value = profileImgPath;
      } else {
        WidgetConst.kSnackBar(title: "No Image Selected", subTitle: "Please Select Image");
        appCommonController.currentImagePath.value = "";
      }
    } catch (e) {
      print(e);
      WidgetConst.kSnackBar(title: "Error !", subTitle: "$e");
      appCommonController.currentImagePath.value = "";
    }
  }
}
