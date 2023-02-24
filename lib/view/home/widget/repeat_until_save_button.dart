import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_flutter/controller/home_page.dart';
import 'package:demo_flutter/controller/utils/constant/colors.dart';
import 'package:demo_flutter/controller/utils/constant/widgets.dart';
import 'package:demo_flutter/view/widgets/custom_elevated_button.dart';

class RepeatUntilAndSaveButton extends StatelessWidget {
  RepeatUntilAndSaveButton({
    Key? key,
  }) : super(key: key);

  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: ThemeConst.kHighLight6Gray,
            width: Get.size.width,
            height: 5,
          ),
          WidgetConst.kHeightSpacer(),

          WidgetConst.kDefaultText(textString: "Repeat until"),
          for (String i in ["Never", "On"])
            Container(
              height: 50,
              width: Get.size.width,
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ThemeConst.kHighLight6Gray,
              ),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    margin: const EdgeInsets.only(right: 7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                  ),
                  WidgetConst.kDefaultText(textString: i),
                ],
              ),
            ),

          WidgetConst.kHeightSpacer(),

          //Save Availability Button
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            height: 50,
            width: Get.size.width,
            child: CustomElevatedButton(
                title: "Save Availability",
                backColor: ThemeConst.kHighLight1,
                isOutlineButton: false,
                width: MediaQuery.of(context).size.width,
                onClick: () {
                  if (_homeController.selectedTimeSlots.value.isEmpty) {
                    WidgetConst.kSnackBar(
                      title: "No Slot Selected",
                      subTitle: "Please select at least one time slot from above.",
                      color: ThemeConst.kRed.withOpacity(0.2),
                    );
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Scaffold(
                                  appBar: AppBar(),
                                  body: Center(child: Text("Selected Value \n\n  ${_homeController.selectedTimeSlots.value}")),
                                ))).then((value) {
                      _homeController.selectedTimeSlots.value = "";
                    });
                  }
                }),
          ),
        ],
      ),
    );
  }
}
