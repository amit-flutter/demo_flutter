import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_flutter/controller/network/api.dart';
import 'package:demo_flutter/controller/utils/constant/colors.dart';
import 'package:demo_flutter/controller/utils/constant/strings.dart';
import 'package:demo_flutter/controller/utils/constant/style.dart';
import 'package:demo_flutter/controller/utils/constant/widgets.dart';
import 'package:demo_flutter/controller/utils/route.dart';
import 'package:demo_flutter/controller/utils/services/share_preference.dart';
import 'package:demo_flutter/view/widgets/custom_elevated_button.dart';
import 'package:demo_flutter/view/widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

enum Login { families, providers }

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Header Part
                  WidgetConst.kHeightSpacer(heightMultiplier: 0.3),
                  WidgetConst.kDefaultText(
                      textString: StringConst.kSignUp, textStyle: WidgetConst.highLight1Bold20.copyWith(fontSize: 35)),
                  WidgetConst.kHeightSpacer(),
                  WidgetConst.kDefaultText(
                      textString: StringConst.kSignUpSubtitle, maxLine: 2, textAlign: TextAlign.start),
                  WidgetConst.kHeightSpacer(heightMultiplier: 2),

                  ///Radio Buttons
                  SizedBox(
                    height: 20,
                    child: Row(
                      children: [
                        const CustomRadioButton(value: Login.families),
                        WidgetConst.kDefaultText(textString: StringConst.kFamilies),
                        WidgetConst.kWidthSpacer(),
                        const CustomRadioButton(value: Login.providers),
                        WidgetConst.kDefaultText(textString: StringConst.kProviders)
                      ],
                    ),
                  ),
                  WidgetConst.kHeightSpacer(),
                  //First Name
                  CustomTextField(
                    title: StringConst.kFirstName,
                    keyBoardType: TextInputType.text,
                    textFieldController: _firstNameController,
                    validation: (value) {
                      return value == null || value.isEmpty || !RegExp(r"^[a-zA-Z0]").hasMatch(value)
                          ? '${StringConst.kPleaseEnter} ${StringConst.kFirstName}.'
                          : null;
                    },
                  ),
                  WidgetConst.kHeightSpacer(),
                  //Last Name
                  CustomTextField(
                    title: StringConst.kLastName,
                    keyBoardType: TextInputType.text,
                    textFieldController: _lastNameController,
                    validation: (value) {
                      return value == null || value.isEmpty || !RegExp(r"^[a-zA-Z0]").hasMatch(value)
                          ? '${StringConst.kPleaseEnter} ${StringConst.kLastName}.'
                          : null;
                    },
                  ),
                  WidgetConst.kHeightSpacer(),
                  //Email
                  CustomTextField(
                    title: StringConst.kEmailAddress,
                    keyBoardType: TextInputType.emailAddress,
                    textFieldController: _emailController,
                    validation: (value) {
                      return value == null ||
                              value.isEmpty ||
                              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)
                          ? '${StringConst.kPleaseEnter} ${StringConst.kValidEmailAddress}.'
                          : null;
                    },
                  ),
                  WidgetConst.kHeightSpacer(),
                  //Mobile Number
                  CustomTextField(
                    title: StringConst.kMobileNumber,
                    keyBoardType: TextInputType.number,
                    textFieldController: _mobileNumberController,
                    validation: (value) {
                      return value == null || value.isEmpty || value.length != 10 || !RegExp(r"^[0-9]").hasMatch(value)
                          ? '${StringConst.kPleaseEnter} ${StringConst.kValidMobileNumber}.'
                          : null;
                    },
                  ),
                  WidgetConst.kHeightSpacer(),
                  CustomTextField(
                    title: StringConst.kPassword,
                    keyBoardType: TextInputType.text,
                    isSecureText: true,
                    isSuffixIcon: true,
                    textFieldController: _passwordController,
                    validation: (value) {
                      return value == null ||
                              value.isEmpty ||
                              !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)
                          ? '${StringConst.kValidPassword}.'
                          : null;
                    },
                  ),
                  WidgetConst.kHeightSpacer(),
                  //Confirm Password
                  CustomTextField(
                    title: StringConst.kConfirmPassword,
                    keyBoardType: TextInputType.text,
                    isSecureText: true,
                    isSuffixIcon: true,
                    textFieldController: _confirmPasswordController,
                    validation: (value) {
                      return value == null ||
                              value.isEmpty ||
                              _passwordController.text != _confirmPasswordController.text
                          ? '${StringConst.kValidConfirmPassword}.'
                          : null;
                    },
                  ),
                  WidgetConst.kHeightSpacer(heightMultiplier: 2),
                  WidgetConst.kDefaultText(
                      textString: StringConst.kIndicatesMandatoryField,
                      textStyle: StyleConst.kHighLight1Normal.copyWith(fontSize: 12)),
                  WidgetConst.kHeightSpacer(heightMultiplier: 0.5),
                  CustomElevatedButton(
                      title: "Sign Up",
                      backColor: ThemeConst.kHighLight1,
                      isOutlineButton: false,
                      width: MediaQuery.of(context).size.width,
                      onClick: () => _submitButtonFunction()),

                  WidgetConst.kHeightSpacer(heightMultiplier: 1.5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      WidgetConst.kDefaultText(
                          textString: StringConst.kHaveAnAccount,
                          textStyle: StyleConst.kBlack18Normal.copyWith(fontSize: 12)),
                      WidgetConst.kDefaultText(
                          textString: StringConst.kSignIn,
                          textStyle: StyleConst.kHighLight1Normal.copyWith(fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //This Function will make Firebase api call which will get message from firebase and register / login user.
  Future<void> _submitButtonFunction() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      // _globalController.isLoading.value = true;
      String email = _emailController.text;
      // String password = _passwordController.text;
      if (email.contains("karmaleen")) {
        WidgetConst.kSnackBar(
            title: "Welcome $email", subTitle: "Please Turn on time before start working.\nHave a good day 😃");
        Get.toNamed(RouteConst.kHomeScreen);
      } else {
        WidgetConst.kSnackBar(
          title: "Hello $email",
          subTitle: "Your email is not register with us please contact manager or visit karmaleen.com",
          color: ThemeConst.kRed.withOpacity(0.2),
        );
      }
      String check = await PostDataProcess().sendData(
          _firstNameController.text,
          _lastNameController.text,
          _emailController.text,
          _mobileNumberController.text,
          _passwordController.text,
          _confirmPasswordController.text);
      print(check);
      if (check == StringConst.kSuccess) {
        print('Working');
        Preferences.setLogin(true);
        Get.toNamed(RouteConst.kHomeScreen);
      } else {}
    }
    _formKey.currentState!.save();
  }
}

class CustomRadioButton extends StatefulWidget {
  const CustomRadioButton({super.key, required this.value});
  final Login value;
  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return Radio(
        visualDensity:
            const VisualDensity(horizontal: VisualDensity.minimumDensity, vertical: VisualDensity.minimumDensity),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        value: widget.value,
        groupValue: widget.value,
        onChanged: (value) {});
  }
}
