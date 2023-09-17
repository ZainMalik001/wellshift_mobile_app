import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:well_shift_app/core/common/app_colors.dart';
import 'package:well_shift_app/presentation/common_widgets/custom_buton.dart';
import 'package:well_shift_app/presentation/common_widgets/custom_text_field.dart';
import 'package:well_shift_app/presentation/common_widgets/terms_privacy_widget.dart';
import 'package:well_shift_app/presentation/pages/login/login_loading_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios,
                          color: AppColors.yellowColor, size: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Login',
                      style: TextStyle(color: AppColors.yellowColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Create new account',
                  style: TextStyle(
                      color: AppColors.buttonBlueColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 21),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Welcome to WellShift',
                  style: TextStyle(color: AppColors.buttonBlueColor),
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  hintText: "Your full name",
                  labelText: "Name",
                ),
                SizedBox(
                  height: 12,
                ),
                CustomTextField(
                  hintText: "Your email",
                  labelText: "Email",
                ),
                SizedBox(
                  height: 12,
                ),
                CustomTextField(
                  hintText: "Your password",
                  labelText: "Password",
                  obscureText: true,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Checkbox(
                        fillColor: MaterialStateProperty.all(
                            AppColors.buttonBlueColor),
                        value: ischecked,
                        onChanged: (value) {
                          setState(() {
                            ischecked = value!;
                          });
                        }),
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Agree with a ',
                              style: TextStyle(
                                color: AppColors.buttonBlueColor,
                              ),
                            ),
                            TextSpan(
                              text: 'Privacy policy ',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TermsOrPrivacy(title: "Privacy Policy", backButtonTitle: "Create Account")));
                                },
                              style: TextStyle(
                                color: AppColors.buttonBlueColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextSpan(
                              text: 'and ',
                              style: TextStyle(
                                color: AppColors.buttonBlueColor,
                              ),
                            ),
                            TextSpan(
                              text: 'Terms of use',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TermsOrPrivacy(title: "Terms of use", backButtonTitle: "Create Account")));
                                },
                              style: TextStyle(
                                color: AppColors.buttonBlueColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                CustomButton(
                  width: double.infinity,
                  text: 'Create Account',
                  textStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  onPressed: () {},
                ),
                SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.buttonBlueColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "OR",
                        style: TextStyle(
                          color: AppColors.buttonBlueColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.buttonBlueColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                CustomButton(
                  width: double.infinity,
                  foregroundColor: Color(0xff6C707F),
                  backgroundColor: Color(0xffEDF6FF),
                  text: 'Continue with Facebook',
                  iconPath: "assets/images/png/facebook_logo.png",
                  textStyle: TextStyle(
                    fontSize: 16,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginLoadingPage(
                          imgPath: "assets/images/png/facebook_logo.png",
                          text: 'Logging in with Facebook...',
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                CustomButton(
                  width: double.infinity,
                  foregroundColor: Color(0xff6C707F),
                  backgroundColor: Color(0xffEDF6FF),
                  text: 'Continue with Google',
                  iconPath: "assets/images/png/google_icon.png",
                  textStyle: TextStyle(
                    fontSize: 16,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginLoadingPage(
                                  imgPath: "assets/images/png/google_icon.png",
                                  text: 'Loggin in with Google...',
                                )));
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                Platform.isIOS ? CustomButton(
                  width: double.infinity,
                  foregroundColor: Color(0xff6C707F),
                  backgroundColor: Color(0xffEDF6FF),
                  text: 'Use Apple account',
                  svgPath: "assets/images/svg/apple.svg",
                  textStyle: TextStyle(
                    fontSize: 16,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginLoadingPage(
                          svgPath: "assets/images/svg/apple.svg",
                          text: 'Loggin in with Apple...',
                        ),
                      ),
                    );
                  },
                ) : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
