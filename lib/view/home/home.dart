import 'package:flutter/material.dart';
import 'package:demo_flutter/controller/utils/constant/sizes.dart';
import 'package:demo_flutter/controller/utils/constant/strings.dart';
import 'package:demo_flutter/controller/utils/constant/style.dart';
import 'package:demo_flutter/controller/utils/constant/widgets.dart';
import 'package:demo_flutter/view/home/widget/repeat_until_save_button.dart';

enum Schedule { daily, timeslot }

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: WidgetConst.kDefaultText(
          textString: StringConst.kManageAvailability,
          textStyle: StyleConst.kBlack18Normal,
        ),
      ),
      body: Padding(
        padding: SizeConst.padding(),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              ///Day & Time Slot at top level of stack
              Column(
                children: [
                  //Repeat Until - Save Availability Button
                  RepeatUntilAndSaveButton()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
