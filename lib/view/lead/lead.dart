import 'package:demo_flutter/controller/app_common_controller.dart';
import 'package:demo_flutter/utils/constant/colors.dart';
import 'package:demo_flutter/utils/constant/strings.dart';
import 'package:demo_flutter/utils/constant/style.dart';
import 'package:demo_flutter/utils/constant/widgets.dart';
import 'package:demo_flutter/view/widgets/custom_drawer.dart';
import 'package:demo_flutter/view/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeadScreen extends StatelessWidget {
  LeadScreen({Key? key}) : super(key: key);

  AppCommonController appCommonController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App Bar Contains Side-Drawer and Add Lead Icon
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return InkWell(onTap: () => Scaffold.of(context).openDrawer(), child: Image.asset(StringConst.kSideMenuIcon));
        }),
        title: WidgetConst.kDefaultText(
            textString: StringConst.kLeads, textStyle: StyleConst.kHighLight216.copyWith(fontSize: 20)),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.add_circle_outline_rounded, color: ThemeConst.kHighLight2White))
        ],
      ),
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Search - Filter and Sort Icon
            SearchAndSortWidget(),
            //Lead ListView
            Expanded(
              child: Obx(() {
                return ListView.builder(
                    itemCount: appCommonController.leadData.length,
                    padding: const EdgeInsets.only(left: 15, right: 10, top: 15, bottom: 15),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 90,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    WidgetConst.kDefaultText(
                                        textString: appCommonController.leadData[index]['contact_name'].toString(),
                                        textStyle: StyleConst.kBlack18Normal.copyWith(fontWeight: FontWeight.bold)),
                                    WidgetConst.kDefaultText(
                                        textString: appCommonController.leadData[index]['cmp_name'].toString(),
                                        textStyle: StyleConst.kHighLight4DarkGray16),
                                    WidgetConst.kDefaultText(
                                        textString: appCommonController.leadData[index]['website'].toString(),
                                        textStyle: StyleConst.kHighLight4DarkGray16),
                                    Obx(() {
                                      return WidgetConst.kDefaultText(
                                          textString: appCommonController.leadData[index]['followDate'].toString(),
                                          textStyle: appCommonController.isSort.value
                                              ? StyleConst.kBlack18Normal
                                              : StyleConst.kHighLight4DarkGray16);
                                    }),
                                  ],
                                ),
                              ),
                              //Side Status Button
                              SizedBox(
                                width: 150,
                                height: 32,
                                child: CustomElevatedButton(
                                  title: appCommonController.leadData[index]['designation'].toString(),
                                  onClick: () {},
                                  isOutlineButton: true,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchAndSortWidget extends StatelessWidget {
  SearchAndSortWidget({super.key});

  AppCommonController appCommonController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          WidgetConst.kWidthSpacer(widthMultiplier: 0.7),

          //Search Bar
          Expanded(
            child: TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: ThemeConst.kHighLight6LightGray, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: ThemeConst.kHighLight1, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Search...',
                  fillColor: ThemeConst.kHighLight6LightGray,
                  filled: true,
                  hintStyle: StyleConst.kHighLight4DarkGray16),
            ),
          ),

          //Filter Icon
          InkWell(
            onTap: () => showFilterOptions(context),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  margin: const EdgeInsets.all(7),
                  padding: const EdgeInsets.all(10),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: ThemeConst.kHighLight4DarkGray, width: 2),
                    color: ThemeConst.kHighLight6LightGray,
                  ),
                  child: Hero(tag: StringConst.kLeadTag, child: Image.asset(StringConst.kLeadIcon)),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: ThemeConst.kHighLight3,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 20,
                  width: 20,
                  child: Center(child: WidgetConst.kDefaultText(textString: "2", textStyle: StyleConst.kHighLight214)),
                )
              ],
            ),
          ),

          //Sort Icon
          Obx(() {
            return Stack(
              alignment: Alignment.topRight,
              children: [
                InkWell(
                  onTap: () => appCommonController.isSort.value
                      ? appCommonController.resetLeadData()
                      : appCommonController.sortLeadDataByFormatDate(),
                  child: Container(
                    margin: const EdgeInsets.all(7),
                    padding: const EdgeInsets.all(10),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: ThemeConst.kHighLight4DarkGray, width: 2),
                      color: ThemeConst.kHighLight6LightGray,
                    ),
                    child: Image.asset(StringConst.kSortIcon),
                  ),
                ),
                if (appCommonController.isSort.value)
                  Container(
                    decoration: BoxDecoration(
                      color: ThemeConst.kHighLight3,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: 20,
                    width: 20,
                    child: Center(
                      child: Icon(Icons.check, size: 12, color: ThemeConst.kHighLight2White),
                    ),
                  ),
              ],
            );
          }),

          WidgetConst.kWidthSpacer(widthMultiplier: 0.3),
        ],
      ),
    );
  }

  void showFilterOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      elevation: 10,
      // constraints: BoxConstraints(maxHeight: 350),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Filter Header
              Container(
                // height: 50,
                color: ThemeConst.kHighLight1,
                child: Column(
                  children: [
                    Container(margin: EdgeInsets.all(5), height: 3, width: 70, color: ThemeConst.kHighLight2White),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                              child: WidgetConst.kDefaultText(
                                  textString: "Filter",
                                  textAlign: TextAlign.start,
                                  textStyle: StyleConst.kHighLight4DarkGray16.copyWith(
                                      color: ThemeConst.kHighLight2White, fontSize: 20, fontWeight: FontWeight.bold))),
                          SizedBox(
                            height: 35,
                            child: CustomElevatedButton(
                              width: 80,
                              title: StringConst.kReset,
                              backColor: ThemeConst.kHighLight2White,
                              buttonTextStle: StyleConst.kBlack18Normal,
                              onClick: () {},
                            ),
                          ),
                          WidgetConst.kWidthSpacer(),
                          SizedBox(
                            height: 35,
                            child: CustomElevatedButton(
                              width: 80,
                              title: StringConst.kApply,
                              backColor: ThemeConst.kHighLight2White,
                              buttonTextStle: StyleConst.kBlack18Normal,
                              onClick: () {},
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              //Filter Body
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WidgetConst.kDefaultText(
                        textString: StringConst.kFilterBy,
                        textStyle: StyleConst.kBlack18Normal.copyWith(fontWeight: FontWeight.bold, fontSize: 20)),
                    Card(
                      margin: EdgeInsets.only(top: 10),
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            WidgetConst.kDefaultText(
                                textString: "Status",
                                textStyle:
                                    StyleConst.kBlack18Normal.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
                            WidgetConst.kHeightSpacer(heightMultiplier: 0.5),
                            Container(
                              width: Get.width,
                              height: 3,
                              color: ThemeConst.kHighLight4DarkGray,
                            ),
                            Row(
                              children: [
                                Checkbox(value: false, onChanged: (val) {}),
                                WidgetConst.kDefaultText(
                                    textString: "Open (10)",
                                    textStyle: StyleConst.kBlack18Normal.copyWith(fontSize: 18)),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(value: true, onChanged: (val) {}),
                                WidgetConst.kDefaultText(
                                    textString: "Completed (5)",
                                    textStyle: StyleConst.kBlack18Normal.copyWith(fontSize: 18)),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(value: false, onChanged: (val) {}),
                                WidgetConst.kDefaultText(
                                    textString: "(Closed)",
                                    textStyle: StyleConst.kBlack18Normal.copyWith(fontSize: 18)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.only(top: 10),
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            WidgetConst.kDefaultText(
                                textString: "Promotions",
                                textStyle:
                                    StyleConst.kBlack18Normal.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
                            WidgetConst.kHeightSpacer(heightMultiplier: 0.5),
                            Container(width: Get.width, height: 3, color: ThemeConst.kHighLight4DarkGray),
                            Row(
                              children: [
                                Checkbox(value: false, onChanged: (val) {}),
                                WidgetConst.kDefaultText(
                                    textString: "GPBD", textStyle: StyleConst.kBlack18Normal.copyWith(fontSize: 18)),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(value: false, onChanged: (val) {}),
                                WidgetConst.kDefaultText(
                                    textString: "JustDial",
                                    textStyle: StyleConst.kBlack18Normal.copyWith(fontSize: 18)),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(value: true, onChanged: (val) {}),
                                WidgetConst.kDefaultText(
                                    textString: "Newspapaer",
                                    textStyle: StyleConst.kBlack18Normal.copyWith(fontSize: 18)),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(value: false, onChanged: (val) {}),
                                WidgetConst.kDefaultText(
                                    textString: "GPBS", textStyle: StyleConst.kBlack18Normal.copyWith(fontSize: 18)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
