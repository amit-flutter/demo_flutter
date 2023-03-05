import 'dart:io';

import 'package:demo_flutter/controller/app_common_controller.dart';
import 'package:demo_flutter/utils/constant/colors.dart';
import 'package:demo_flutter/utils/constant/strings.dart';
import 'package:demo_flutter/utils/constant/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//user Profile image- On Trap of camara icon user can select new image from system storage or camara.
class ProfileImage extends StatelessWidget {
  ProfileImage({Key? key}) : super(key: key);

  String profileImgPath = '';
  late File profileImg;
  bool isImageSelected = false;
  final AppCommonController _appCommonController = Get.put(AppCommonController());

  @override
  Widget build(BuildContext context) {
    /// User Picture
    return Container(
      padding: const EdgeInsets.all(15),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Obx(() {
            return Hero(
              tag: StringConst.kProfileTag,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Get.width / 2),
                child: _appCommonController.currentImagePath.value == ''
                    ? Image.asset(
                  StringConst.kProfileImage,
                  height: Get.width / 3.5,
                  width: Get.width / 3.5,
                  fit: BoxFit.cover,
                )
                    : Image.file(
                  File(_appCommonController.currentImagePath.value),
                  height: Get.width / 3.5,
                  width: Get.width / 3.5,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
          Positioned(
            bottom: -1,
            right: -4,
            child: CircleAvatar(
              backgroundColor: ThemeConst.kHighLight2White,
              radius: 19,
              child: IconButton(
                  icon: const Icon(Icons.add_a_photo_rounded, color: ThemeConst.kHighLight1),
                  onPressed: () {
                    WidgetConst.gallerySelectionSheet(context);
                  },
                  iconSize: 22),
            ),
          )
        ],
      ),
    );
    // return Stack(
    //   children: [
    //     Padding(
    //       padding: const EdgeInsets.only(top: 5.0),
    //       child: ClipRRect(
    //         borderRadius: BorderRadius.only(
    //           bottomLeft: Radius.circular(47.5),
    //           bottomRight: Radius.circular(47.5),
    //           topLeft: Radius.circular(47.5),
    //           topRight: Radius.circular(47.5),
    //         ),
    //         child: (profileImgPath.length == 0)
    //             ? Image.asset(
    //           'assets/avtar1.png',
    //           height: 95.0,
    //           width: 95.0,
    //           fit: BoxFit.fill,
    //         )
    //             : isImageSelected
    //             ? Image.file(
    //           profileImg,
    //           height: 95.0,
    //           width: 95.0,
    //           fit: BoxFit.fill,
    //         )
    //             : CachedNetworkImage(
    //           fit: BoxFit.fill,
    //           height: 95.0,
    //           width: 95.0,
    //           progressIndicatorBuilder: (context, url, progress) => Center(
    //             child: CircularProgressIndicator(
    //               value: progress.progress,
    //               color: ThemeConst.kHighLight3Black,
    //             ),
    //           ),
    //           imageUrl: profileImgPath,
    //         ),
    //       ),
    //     ),
    //     InkWell(
    //       onTap: () {
    //         gallerySelectionSheet(context);
    //       },
    //       child: Padding(
    //         padding: const EdgeInsets.fromLTRB(78.0, 70.0, 0.0, 0.0),
    //         child: Image.asset(
    //           'assets/profileEditIcon.png',
    //           fit: BoxFit.fill,
    //           height: 25.0,
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}