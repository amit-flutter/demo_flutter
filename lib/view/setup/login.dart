// ignore_for_file: avoid_print

import 'package:demo_flutter/network/api_call.dart';
import 'package:demo_flutter/utils/constant/colors.dart';
import 'package:demo_flutter/utils/constant/sizes.dart';
import 'package:demo_flutter/utils/constant/strings.dart';
import 'package:demo_flutter/utils/constant/style.dart';
import 'package:demo_flutter/utils/constant/widgets.dart';
import 'package:demo_flutter/utils/route.dart';
import 'package:demo_flutter/utils/services/share_preference.dart';
import 'package:demo_flutter/view/widgets/custom_elevated_button.dart';
import 'package:demo_flutter/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(height: Get.height / 3.8, color: ThemeConst.kHighLight1),
              Expanded(child: Container(color: ThemeConst.kHighLight2)),
            ],
          ),

          ///Header Part
          Padding(
            padding: const EdgeInsets.all(SizeConst.kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WidgetConst.kHeightSpacer(heightMultiplier: 2),
                WidgetConst.kDefaultText(
                    textString: StringConst.kLogin, textStyle: WidgetConst.kHighLight2Bold16.copyWith(fontSize: 35)),
                WidgetConst.kHeightSpacer(),
                WidgetConst.kDefaultText(
                    textString: StringConst.kSignUpSubtitle, maxLine: 2, textStyle: WidgetConst.kHighLight2Bold16),
                WidgetConst.kHeightSpacer(heightMultiplier: 2),
              ],
            ),
          ),
          Card(
            margin:
                EdgeInsets.only(top: Get.height / 5, left: SizeConst.kDefaultPadding, right: SizeConst.kDefaultPadding),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
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
                          return value == null || value.isEmpty ? '${StringConst.kValidPassword}.' : null;
                        },
                      ),
                      WidgetConst.kHeightSpacer(),
                      isLoading
                          ? const Center(child: CircularProgressIndicator(color: ThemeConst.kHighLight1))
                          : CustomElevatedButton(
                              title: StringConst.kLogin,
                              backColor: ThemeConst.kHighLight1,
                              isOutlineButton: false,
                              width: MediaQuery.of(context).size.width,
                              onClick: () => _submitButtonFunction()),

                      WidgetConst.kHeightSpacer(heightMultiplier: 1.5),
                      WidgetConst.kDefaultText(
                          textString: StringConst.kForgotPassword,
                          textStyle: StyleConst.kHighLight4DarkGray16.copyWith(color: Colors.grey)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  onTap: () => Get.toNamed(RouteConst.kRegister),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      WidgetConst.kDefaultText(
                          textString: StringConst.kHaveAnAccount,
                          textStyle: StyleConst.kHighLight4DarkGray16.copyWith(color: Colors.grey)),
                      WidgetConst.kDefaultText(
                          textString: StringConst.kSignUp, textStyle: StyleConst.kBlack18Normal.copyWith(fontSize: 16)),
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
      setState(() => isLoading = !isLoading);
      //Demo Account is :a@a.com / Test@123
      String email = _emailController.text;
      String password = _passwordController.text;
      PostApiCall postApiCall = PostApiCall();

      String response = await postApiCall.login(email: email, password: password);
      print(response);
      setState(() => isLoading = !isLoading);
      if (response == StringConst.kSuccess) {
        print('LOGIN -------->');
        await Preferences.setLogin(true);
        Get.offAllNamed(RouteConst.kHomeScreen);
      } else {}
    }
    _formKey.currentState!.save();
  }
}
