import 'package:demo_flutter/network/api_call.dart';
import 'package:demo_flutter/utils/constant/colors.dart';
import 'package:demo_flutter/utils/constant/sizes.dart';
import 'package:demo_flutter/utils/constant/strings.dart';
import 'package:demo_flutter/utils/constant/style.dart';
import 'package:demo_flutter/utils/constant/widgets.dart';
import 'package:demo_flutter/utils/route.dart';
import 'package:demo_flutter/view/home/widget/user_info.dart';
import 'package:demo_flutter/view/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    dataLoad();
    super.initState();
  }

  void dataLoad() async{
    print("------------>");
    GetApiCall getApiCall = GetApiCall();
    var response = await getApiCall.getData();
    // print(response.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return InkWell(onTap: () => Scaffold.of(context).openDrawer(), child: Image.asset(StringConst.kSideMenuIcon));
        }),
        actions: [Image.asset(StringConst.kNotificationIcon)],
      ),
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
                UserInfo(),
                WidgetConst.kHeightSpacer(heightMultiplier: 3),
                Expanded(
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
                          budgeNumber: "8",
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
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

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
