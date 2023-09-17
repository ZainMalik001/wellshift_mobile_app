import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:well_shift_app/core/common/enums.dart';

import '../../../../core/common/app_colors.dart';
import '../../../common_widgets/custom_back_button.dart';

class ChooseLanguagePage extends StatefulWidget {
  const ChooseLanguagePage({Key? key}) : super(key: key);

  @override
  State<ChooseLanguagePage> createState() => _ChooseLanguagePageState();
}

class _ChooseLanguagePageState extends State<ChooseLanguagePage> {
  Language selectedLanguage = Language.English;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomBackButton(title: "Profile"),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Language",
                    style: TextStyle(
                      color: Color(0xff0364ad),
                      fontSize: 21,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedLanguage = Language.English;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 44,
                width: double.infinity,
                color: selectedLanguage == Language.English ? Color(0xffF7FCFE).withOpacity(0.5): Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/svg/english.svg"),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "English",
                          style: TextStyle(
                            color: selectedLanguage == Language.English ? Color(0xff0364ad) : Color(0xff147CCB),
                            fontSize: 16,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    selectedLanguage == Language.English ? Icon(
                      Icons.done,
                      color: Color(0xff0364ad),
                    ): SizedBox()
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedLanguage = Language.Arabic;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 44,
                width: double.infinity,
                color: selectedLanguage == Language.Arabic ? Color(0xffF7FCFE).withOpacity(0.5): Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/svg/jordan.svg"),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Arabic",
                          style: TextStyle(
                            color: selectedLanguage == Language.Arabic ? Color(0xff0364ad) : Color(0xff147CCB),
                            fontSize: 16,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    selectedLanguage == Language.Arabic ?Icon(
                      Icons.done,
                      color: Color(0xff0364ad),
                    ) : SizedBox()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
