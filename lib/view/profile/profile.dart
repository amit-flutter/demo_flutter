// ignore_for_file: must_be_immutable
import 'dart:io';
import 'package:demo_flutter/controller/app_common_controller.dart';
import 'package:demo_flutter/utils/constant/colors.dart';
import 'package:demo_flutter/utils/constant/sizes.dart';
import 'package:demo_flutter/utils/constant/strings.dart';
import 'package:demo_flutter/utils/constant/style.dart';
import 'package:demo_flutter/utils/constant/widgets.dart';
import 'package:demo_flutter/view/widgets/custom_drawer.dart';
import 'package:demo_flutter/view/widgets/custom_elevated_button.dart';
import 'package:demo_flutter/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Builder(builder: (context) {
        return InkWell(onTap: () => Scaffold.of(context).openDrawer(), child: Image.asset(StringConst.kSideMenuIcon));
      })),
      drawer: const CustomDrawer(),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(height: Get.height / 3.8, color: ThemeConst.kHighLight1),
              Expanded(child: Container(color: ThemeConst.kHighLight2)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(SizeConst.kDefaultPadding * 0.5),
            child: Column(
              children: [
                ///Profile image , Select image from system storage
                ProfileImage(),

                ///Input field - Full Name , Company name , Email , Mobile Number
                Card(
                  margin: const EdgeInsets.only(
                      top: SizeConst.kDefaultPadding,
                      left: SizeConst.kDefaultPadding,
                      right: SizeConst.kDefaultPadding),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                //Full Name
                                CustomTextField(
                                  title: StringConst.kFullName,
                                  keyBoardType: TextInputType.text,
                                  textFieldController: _fullNameController,
                                  validation: (value) {
                                    return value == null || value.isEmpty || !RegExp(r"^[a-zA-Z0]").hasMatch(value)
                                        ? '${StringConst.kPleaseEnter} ${StringConst.kFullName}.'
                                        : null;
                                  },
                                ),
                                WidgetConst.kHeightSpacer(),
                                //Company Name
                                CustomTextField(
                                  title: StringConst.kCompanyName,
                                  keyBoardType: TextInputType.text,
                                  textFieldController: _companyNameController,
                                  validation: (value) {
                                    return value == null || value.isEmpty || !RegExp(r"^[a-zA-Z0]").hasMatch(value)
                                        ? '${StringConst.kPleaseEnter} ${StringConst.kCompanyName}.'
                                        : null;
                                  },
                                ),
                                WidgetConst.kHeightSpacer(),
                                //Email
                                CustomTextField(
                                  title: StringConst.kEmailAddress,
                                  keyBoardType: TextInputType.emailAddress,
                                  textFieldController: _emailController,
                                  validation: (value) {
                                    return value == null ||
                                            value.isEmpty ||
                                            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                .hasMatch(value)
                                        ? '${StringConst.kPleaseEnter} ${StringConst.kValidEmailAddress}.'
                                        : null;
                                  },
                                ),
                                WidgetConst.kHeightSpacer(),
                                //Mobile Number
                                CustomTextField(
                                  title: StringConst.kMobileNumber,
                                  keyBoardType: TextInputType.number,
                                  textFieldController: _mobileNumberController,
                                  validation: (value) {
                                    return value == null ||
                                            value.isEmpty ||
                                            value.length != 10 ||
                                            !RegExp(r"^[0-9]").hasMatch(value)
                                        ? '${StringConst.kPleaseEnter} ${StringConst.kValidMobileNumber}.'
                                        : null;
                                  },
                                ),
                                WidgetConst.kHeightSpacer(),

                                //Submit and Cancel Button
                                Row(
                                  children: [
                                    CustomElevatedButton(
                                      title: StringConst.kSubmit,
                                      backColor: ThemeConst.kHighLight1,
                                      isOutlineButton: false,
                                      width: Get.width / 3,
                                      onClick: () => {},
                                    ),
                                    WidgetConst.kWidthSpacer(),
                                    TextButton(
                                      onPressed: () => Get.back(),
                                      child: WidgetConst.kDefaultText(
                                        textString: StringConst.kCancel,
                                        textStyle: StyleConst.kHighLight1Normal,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

//user Profile image- On Trap of camara icon user can select new image from system storage or camara.
class ProfileImage extends StatelessWidget {
  ProfileImage({Key? key}) : super(key: key);

  String profileImgPath = '';
  late File profileImg;
  bool isImageSelected = false;
  final AppCommonController _appCommonController = Get.find();

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
