import 'package:flutter/material.dart';
import 'package:well_shift_app/presentation/common_widgets/custom_back_button.dart';

import '../../../../core/common/app_colors.dart';

class ForYouDetail extends StatelessWidget {
  const ForYouDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomBackButton(
                  title: "Recommendations",
                  icon: Icon(
                    Icons.info,
                    color: Color(0xffFE9F93),
                  ),
                  iconOnPressed: () {},
                ),
              ),
              Image.asset(
                "assets/images//png/static/image.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Article title goes here',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(3, 100, 173, 1),
                      fontFamily: 'Poppins',
                      fontSize: 21,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.w600,
                      height: 1.4761904761904763),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Figma Flutter Generator IfthereisanyarticlesubtitlegoeshereWidget - TEXT
                    Text(
                      'if there is any article subtitle goes here ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(3, 100, 173, 1),
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.w500,
                          height: 1.9375),
                    ),

                    Text(
                      'this is the first paragraph goes here with any number of lines just keep this style of content.\n In the second paragraph, Describe whatever you want or write down what you need here with any number of lines, feel free to down here but don’t miss the paragraph style, and the end of the line should not be broken, keep the lines as I did here.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(11, 111, 186, 1),
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.w400,
                          height: 2),
                    ),
                    SizedBox(
                      height: 10,
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
                          'Second highlight',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(3, 100, 173, 1),
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.w500,
                              height: 1.9375),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Descripe the higlighted point here, but keep in mind to maintains fluidity in the paragraph as the lines should not be breaked randomly, you have to complete the line untile the end as I did here.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(11, 111, 186, 1),
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.w400,
                          height: 2),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'If there Is An H2 Title Let is Goes Here',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(3, 100, 173, 1),
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.w500,
                          height: 1.9375),
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    Text(
                      'Second title small paragraph to starter before highlighting the term of use, or it may need a paragraph, Also don’t miss to keep it’s fluidity.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(11, 111, 186, 1),
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.w400,
                        height: 2,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
