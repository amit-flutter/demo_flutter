import 'package:flutter/material.dart';
import 'package:demo_flutter/utils/constant/colors.dart';
import 'package:demo_flutter/utils/constant/style.dart';
import 'package:demo_flutter/utils/constant/widgets.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.title,
    required this.onClick,
    this.width = 40,
    this.radius = 10,
    this.foreColor = ThemeConst.kHighLight1,
    this.backColor = ThemeConst.kHighLight3DeepBlue,
    this.isOutlineButton = false,
  }) : super(key: key);
  final String title;
  final Function onClick;
  final double width;
  final double radius;
  final Color foreColor;
  final Color backColor;
  final bool isOutlineButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: width,
      child: !isOutlineButton
          ? ElevatedButton(
              onPressed: () => onClick(),
              style: ElevatedButton.styleFrom(
                  foregroundColor: foreColor,
                  backgroundColor: backColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius))),
              child: WidgetConst.kButtonText(textString: title),
            )
          : OutlinedButton(
              onPressed: () => onClick(),
              style: OutlinedButton.styleFrom(side: const BorderSide(width: 2.0, color: ThemeConst.kHighLight1)),
              child: WidgetConst.kDefaultText(textString: title, textStyle: StyleConst.kTeal18Normal),
            ),
    );
  }
}