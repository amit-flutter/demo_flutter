// ignore_for_file: avoid_print

import 'package:demo_flutter/utils/constant/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_flutter/controller/network/api.dart';
import 'package:demo_flutter/utils/constant/colors.dart';
import 'package:demo_flutter/utils/constant/strings.dart';
import 'package:demo_flutter/utils/constant/style.dart';
import 'package:demo_flutter/utils/constant/widgets.dart';
import 'package:demo_flutter/utils/route.dart';
import 'package:demo_flutter/utils/services/share_preference.dart';
import 'package:demo_flutter/view/widgets/custom_elevated_button.dart';
import 'package:demo_flutter/view/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(height: Get.height / 3.5, color: ThemeConst.kHighLight1),
              Expanded(child: Container(color: ThemeConst.kHighLight2)),
            ],
          ),

          ///Header Part
          Padding(
            padding: const EdgeInsets.all(SizeConst.kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WidgetConst.kHeightSpacer(heightMultiplier: 6),
                WidgetConst.kDefaultText(
                    textString: StringConst.kSignUp, textStyle: WidgetConst.kHighLight2Bold16.copyWith(fontSize: 35)),
                WidgetConst.kHeightSpacer(),
                WidgetConst.kDefaultText(
                    textString: StringConst.kSignUpSubtitle, maxLine: 2, textStyle: WidgetConst.kHighLight2Bold16),
                WidgetConst.kHeightSpacer(heightMultiplier: 2),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.only(
                top: Get.height / 3.7, left: SizeConst.kDefaultPadding, right: SizeConst.kDefaultPadding),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          //Full Name
                          CustomTextField(
                            title: StringConst.kFullName,
                            keyBoardType: TextInputType.text,
                            textFieldController: _firstNameController,
                            validation: (value) {
                              return value == null || value.isEmpty || !RegExp(r"^[a-zA-Z0]").hasMatch(value)
                                  ? '${StringConst.kPleaseEnter} ${StringConst.kFullName}.'
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
                              return value == null ||
                                      value.isEmpty ||
                                      value.length != 10 ||
                                      !RegExp(r"^[0-9]").hasMatch(value)
                                  ? '${StringConst.kPleaseEnter} ${StringConst.kValidMobileNumber}.'
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
                          CustomTextField(
                            title: StringConst.kPassword,
                            keyBoardType: TextInputType.text,
                            isSecureText: true,
                            isSuffixIcon: true,
                            textFieldController: _passwordController,
                            validation: (value) {
                              return value == null ||
                                      value.isEmpty ||
                                      !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                          .hasMatch(value)
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
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
        await Preferences.setLogin(true);
        Get.offAllNamed(RouteConst.kHomeScreen);
      } else {}
    }
    _formKey.currentState!.save();
  }
}
