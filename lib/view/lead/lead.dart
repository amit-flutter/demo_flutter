import 'package:demo_flutter/controller/app_common_controller.dart';
import 'package:demo_flutter/utils/constant/colors.dart';
import 'package:demo_flutter/utils/constant/sizes.dart';
import 'package:demo_flutter/utils/constant/strings.dart';
import 'package:demo_flutter/utils/constant/style.dart';
import 'package:demo_flutter/utils/constant/widgets.dart';
import 'package:demo_flutter/view/widgets/custom_drawer.dart';
import 'package:demo_flutter/view/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeadScreen extends StatelessWidget {
  LeadScreen({Key? key}) : super(key: key);

  AppCommonController appCommonController = Get.put(AppCommonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            SearchAndSortWidget(),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                    itemCount: appCommonController.leadData.length,
                    padding: const EdgeInsets.all(15),
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
                                    WidgetConst.kDefaultText(
                                        textString: appCommonController.leadData[index]['followDate'].toString(),
                                        textStyle: StyleConst.kHighLight4DarkGray16),
                                  ],
                                ),
                              ),
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
                  suffixIcon: Icon(Icons.search),
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
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                margin: EdgeInsets.all(7),
                padding: EdgeInsets.all(10),
                child: Hero(tag: StringConst.kLeadTag, child: Image.asset(StringConst.kLeadIcon)),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: ThemeConst.kHighLight4DarkGray, width: 2),
                  color: ThemeConst.kHighLight6LightGray,
                ),
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

          //Sort Icon
          Stack(
            alignment: Alignment.topRight,
            children: [
              InkWell(
                onTap: () => appCommonController.sortLeadDataByFormatDate(),
                child: Container(
                  margin: EdgeInsets.all(7),
                  padding: EdgeInsets.all(10),
                  child: Image.asset(StringConst.kSortIcon),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: ThemeConst.kHighLight4DarkGray, width: 2),
                    color: ThemeConst.kHighLight6LightGray,
                  ),
                ),
              ),
              if (false)
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

          WidgetConst.kWidthSpacer(widthMultiplier: 0.3),
        ],
      ),
    );
  }
}
