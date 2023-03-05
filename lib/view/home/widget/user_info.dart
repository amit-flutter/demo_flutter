import 'package:demo_flutter/controller/app_common_controller.dart';
import 'package:demo_flutter/utils/constant/strings.dart';
import 'package:demo_flutter/utils/constant/style.dart';
import 'package:demo_flutter/utils/constant/widgets.dart';
import 'package:demo_flutter/utils/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserInfo extends StatelessWidget {
  UserInfo({super.key});

  AppCommonController appCommonController = Get.put(AppCommonController());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Profile Image
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Hero(
            tag: StringConst.kProfileTag,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(Get.width / 3),
                child: Image.asset(
                  StringConst.kProfileImage,
                  height: Get.width / 6,
                  width: Get.width / 6,
                  fit: BoxFit.cover,
                )),
          ),
        ),
        WidgetConst.kWidthSpacer(widthMultiplier: 0.5),

        //Name and Subtitle
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetConst.kDefaultText(
                textString: "GAURAV VEKARIYA",
                textStyle: StyleConst.kHighLight216.copyWith(fontWeight: FontWeight.bold)),
            WidgetConst.kDefaultText(textString: "ABC", textStyle: StyleConst.kHighLight214),
          ],
        ),
        const Spacer(),

        //Edit Icon
        InkWell(
          onTap: () => Get.toNamed(RouteConst.kProfileScreen),
          child: Image.asset(
            StringConst.kPencilIcon,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
