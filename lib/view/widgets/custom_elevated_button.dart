import 'package:flutter/material.dart';
import 'package:demo_flutter/controller/utils/constant/colors.dart';
import 'package:demo_flutter/controller/utils/constant/style.dart';
import 'package:demo_flutter/controller/utils/constant/widgets.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.title,
    required this.onClick,
    this.width = 40,
    this.foreColor = ThemeConst.kHighLight1,
    this.backColor = ThemeConst.kHighLight3DeepBlue,
    this.isOutlineButton = false,
  }) : super(key: key);
  final String title;
  final Function onClick;
  final double width;
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
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
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

// class CustomElevatedButtonWithChild extends StatelessWidget {
//   const CustomElevatedButtonWithChild({
//     Key? key,
//     required this.child,
//     required this.onClick,
//     this.height = 40,
//     this.foreColor = ColorConst.kBackgroundLight,
//     this.backColor = ColorConst.kHighLight1,
//     this.isOutlineButton = false,
//   }) : super(key: key);
//   final Widget child;
//   final Function() onClick;
//   final double height;
//   final Color foreColor;
//   final Color backColor;
//   final bool isOutlineButton;
//
//   @override
//   Widget build(BuildContext context) {
//     return Flexible(
//       child: SizedBox(
//         height: 40,
//         child: !isOutlineButton
//             ? ElevatedButton(
//           onPressed: onClick,
//           style: ElevatedButton.styleFrom(
//             foregroundColor: foreColor,
//             backgroundColor: backColor,
//           ),
//           child: child,
//         )
//             : OutlinedButton(
//           onPressed: () => onClick(),
//           style: OutlinedButton.styleFrom(side: const BorderSide(width: 2.0, color: ColorConst.kHighLight1)),
//           child: child,
//         ),
//       ),
//     );
//   }
// }
