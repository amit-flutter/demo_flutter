import 'package:demo_flutter/utils/constant/colors.dart';
import 'package:demo_flutter/utils/constant/strings.dart';
import 'package:demo_flutter/utils/constant/style.dart';
import 'package:demo_flutter/utils/constant/widgets.dart';
import 'package:demo_flutter/utils/route.dart';
import 'package:demo_flutter/utils/services/share_preference.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            //Header
            Column(
              children: [
                //Image And Divider
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        StringConst.kLogoImage,
                        height: 60,
                        color: ThemeConst.kHighLight1,
                      ),
                      WidgetConst.kHeightSpacer(),
                      Container(width: Get.width, height: 2, color: ThemeConst.kHighLight4DarkGray),
                    ],
                  ),
                ),

                //Drawer Items
                ListTile(
                  leading: const Icon(Icons.menu),
                  title: WidgetConst.kDefaultText(textString: StringConst.kLeads, textAlign: TextAlign.start),
                ),
                ListTile(
                  leading: const Icon(Icons.lock),
                  title: WidgetConst.kDefaultText(textString: StringConst.kChangePassword, textAlign: TextAlign.start),
                ),
              ],
            ),
            const Spacer(),
            //Footer
            SizedBox(
              width: Get.width,
              height: 60,
              child: ElevatedButton(
                onPressed: () async {
                  await Preferences.setLogin(false);
                  Get.offAllNamed(RouteConst.kRegister);
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: ThemeConst.kHighLight2White,
                    backgroundColor: ThemeConst.kHighLight1,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
                child: Row(children: [
                  const Icon(Icons.exit_to_app),
                  WidgetConst.kWidthSpacer(),
                  WidgetConst.kDefaultText(textString: StringConst.kLogout, textStyle: StyleConst.kHighLight214)
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
