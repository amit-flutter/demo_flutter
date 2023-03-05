// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:demo_flutter/controller/app_common_controller.dart';
import 'package:demo_flutter/network/api_call.dart';
import 'package:demo_flutter/utils/constant/colors.dart';
import 'package:demo_flutter/utils/constant/sizes.dart';
import 'package:demo_flutter/utils/constant/strings.dart';
import 'package:demo_flutter/utils/constant/style.dart';
import 'package:demo_flutter/utils/constant/widgets.dart';
import 'package:demo_flutter/utils/route.dart';
import 'package:demo_flutter/view/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AppCommonController appCommonController = Get.put(AppCommonController());

  @override
  void initState() {
    dataLoad();
    super.initState();
  }

  //dataLoad Function will make API call and load lead data.
  //data will be manage by app_common_controller
  void dataLoad() async {
    GetApiCall getApiCall = GetApiCall();
    await getApiCall.getLeadData();
    await getApiCall.getLeadCountData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App Bar (Drawer menu and Notification icon)
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return InkWell(onTap: () => Scaffold.of(context).openDrawer(), child: Image.asset(StringConst.kSideMenuIcon));
        }),
        actions: [Image.asset(StringConst.kNotificationIcon)],
      ),
      //Side Drawer
      drawer: const CustomDrawer(),
      //Main Body part (User Information - Lead - Task ... Card View)
      body: Stack(
        children: [
          //Background Green Color Effect
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
                //User image - Name - Edit Icon
                UserInfo(),
                WidgetConst.kHeightSpacer(heightMultiplier: 3),
                //Grid View for 4 options.
                Obx(() {
                  return Expanded(
                    child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 30,
                        crossAxisCount: 2,
                        children: <Widget>[
                          HomeCard(
                            iconWidget: Hero(tag: StringConst.kLeadTag, child: Image.asset(StringConst.kLeadIcon)),
                            title: StringConst.kLeads,
                            isBudge: true,
                            budgeNumber: "${appCommonController.leadCount.value}",
                            onTap: () => Get.toNamed(RouteConst.kLeadScreen),
                          ),
                          HomeCard(
                            iconWidget: Image.asset(StringConst.kTaskIcon),
                            title: StringConst.kTasks,
                            isBudge: true,
                            budgeNumber: "10",
                            onTap: () {},
                          ),
                          HomeCard(iconWidget: const SizedBox(), title: StringConst.kFollowUpLead, onTap: () {}),
                          HomeCard(iconWidget: const SizedBox(), title: StringConst.kDueFollowUpLead, onTap: () {}),
                        ]),
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}

//UserInfo (Image Name-SubTitle-EditIcon)
class UserInfo extends StatelessWidget {
  UserInfo({super.key});

  AppCommonController appCommonController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Profile Image
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Hero(
            tag: StringConst.kProfileTag,
            child: Obx(() {
              return ClipRRect(
                borderRadius: BorderRadius.circular(Get.width / 3),
                child: appCommonController.currentImagePath.value == ''
                    ? Image.asset(
                        StringConst.kProfileImage,
                        height: Get.width / 6,
                        width: Get.width / 6,
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        File(appCommonController.currentImagePath.value),
                        height: Get.width / 6,
                        width: Get.width / 6,
                        fit: BoxFit.cover,
                      ),
              );
            }),
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

//Home Card have 5 properties (1-Icon Widget, 2-title of card,3-show budge on card,4-budge number,5-onTap Function)
class HomeCard extends StatelessWidget {
  const HomeCard(
      {super.key,
      required this.iconWidget,
      required this.title,
      this.isBudge = false,
      this.budgeNumber = "0",
      required this.onTap});

  final Widget iconWidget;
  final String title;
  final bool isBudge;
  final String budgeNumber;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            width: Get.width,
            padding: const EdgeInsets.all(10),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(),
                    iconWidget,
                    WidgetConst.kDefaultText(
                        textString: title,
                        textStyle: StyleConst.kBlack18Normal.copyWith(fontWeight: FontWeight.w500),
                        maxLine: 2),
                  ],
                ),
              ),
            ),
          ),
          if (isBudge)
            Container(
              decoration: BoxDecoration(
                color: ThemeConst.kHighLight3,
                borderRadius: BorderRadius.circular(15),
              ),
              height: 30,
              width: 30,
              child:
                  Center(child: WidgetConst.kDefaultText(textString: budgeNumber, textStyle: StyleConst.kHighLight216)),
            )
        ],
      ),
    );
  }
}
