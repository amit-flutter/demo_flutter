import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.title,
    required this.keyBoardType,
    this.isHideTitle = false,
    this.isSecureText = false,
    this.isSuffixIcon = false,
    this.validation,
    required this.textFieldController,
  }) : super(key: key);

  final String title;
  final TextInputType keyBoardType;
  final bool isHideTitle;
  final bool isSecureText;
  final bool isSuffixIcon;

  final String? Function(String?)? validation;
  final TextEditingController textFieldController;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        keyboardType: widget.keyBoardType,
        obscureText: widget.isSecureText && _passwordVisible,
        validator: widget.validation,
        controller: widget.textFieldController,
        decoration: InputDecoration(
          //  labelText: widget.title,
          hintText: "${widget.title}*",

          // hintStyle: WidgetConst.kHighLightDark18.copyWith(color: Colors.grey),
          suffixIcon: widget.isSuffixIcon
              ? IconButton(
                  padding: const EdgeInsets.only(right: 20),
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    // color: ColorConst.kHighLight3,
                    size: 30,
                  ),
                  onPressed: () => setState(() => _passwordVisible = !_passwordVisible),
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
