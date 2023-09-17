import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:well_shift_app/core/common/app_colors.dart';
import 'package:well_shift_app/core/raw_data/faq_raw.dart';

import '../../../common_widgets/custom_back_button.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
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
                    "Frequently Asked Questions",
                    style: TextStyle(
                      color: Color(0xff0364ad),
                      fontSize: 21,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Search for question",
                      hintStyle: TextStyle(
                        color: Color(0xff84AFD1),
                        fontSize: 16,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                      ),
                      prefixIcon: Icon(
                        CupertinoIcons.search,
                        color: Color(0xff84AFD1),
                        size: 20,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xff8E8E8E),
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xff84AFD1),
                          width: 1,
                        ),
                      ),
                      filled: true,
                      fillColor: AppColors.textFieldBackgroundColor,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  shrinkWrap: true,
                  itemCount: faq.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FAQDetailPage(
                              question: faq[index],
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    faq[index],
                                    style: TextStyle(
                                      color: Color(0xff0364ad),
                                      fontSize: 16,
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Icon(Icons.keyboard_arrow_right,
                                    color: Color(0xff0364ad)),
                              ],
                            ),
                          ),
                          Divider(
                            height: 1,
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class FAQDetailPage extends StatelessWidget {
  final String question;
  const FAQDetailPage({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomBackButton(title: "FAQ"),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    question,
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
              height: 40,
            ),
            Divider(),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcoming small paragraph to starter before highlighting the term of use:",
                    style: TextStyle(
                      color: Color(0xff0b6fba),
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Descripe the higlighted point here, but keep in mind to maintains fluidity in the paragraph as the lines should not be breaked randomly, you have to complete the line untile the end as I did here.",
                    style: TextStyle(
                      color: Color(0xff0b6fba),
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.buttonBlueColor),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Second highlight",
                        style: TextStyle(
                          color: Color(0xff0364ad),
                          fontSize: 16,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Descripe the higlighted point here, but keep in mind to maintains fluidity in the paragraph as the lines should not be breaked randomly, you have to complete the line untile the end as I did here.",
                    style: TextStyle(
                      color: Color(0xff0b6fba),
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "If there Is An H2 Title Let is Goes Here",
                    style: TextStyle(
                      color: Color(0xff0364ad),
                      fontSize: 16,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Second title small paragraph to starter before highlighting the term of use, or it may need\na paragraph, Also don’t miss to keep it’s fluidity.",
                    style: TextStyle(
                      color: Color(0xff0b6fba),
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x330364ad),
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                            color: Color(0xfffafbff),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/images/svg/like.svg"),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                    "Was helpful",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xff52a8ea),
                                        fontSize: 14,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w500,
                                    ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x330364ad),
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                            color: Color(0xfffafbff),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/images/svg/unlike.svg"),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                    "Was helpful",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xff52a8ea),
                                        fontSize: 14,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w500,
                                    ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
