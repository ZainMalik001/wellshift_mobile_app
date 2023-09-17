import 'package:flutter/material.dart';
import 'package:well_shift_app/core/common/app_colors.dart';
import 'package:well_shift_app/presentation/common_widgets/custom_back_button.dart';

class TermsOrPrivacy extends StatelessWidget {
  final String title;
  final String backButtonTitle;
  const TermsOrPrivacy(
      {Key? key, required this.title, required this.backButtonTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomBackButton(title: backButtonTitle),
                  SizedBox(height: 20),
                  Text(
                    title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(3, 100, 173, 1),
                        fontFamily: 'Poppins',
                        fontSize: 21,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1.4761904761904763),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'H1 Title Goes Here:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(3, 100, 173, 1),
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1.9375,
                    ),
                  ),
                  SizedBox(height: 5),
                  // Figma Flutter Generator WelcomingsmallparagraphtostarterbeforehighlightingthetermofuseWidget - TEXT
                  Text(
                    'Welcoming small paragraph to starter before highlighting the term of use:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(11, 111, 186, 1),
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 2),
                  ),
                  SizedBox(height: 12),
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
                        "First highlight",
                        style: TextStyle(
                          color: Color(0xff0364ad),
                          fontSize: 16,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  // Figma Flutter Generator DescripethehiglightedpointherebutkeepinmindtomaintainsfluidityintheparagraphasthelinesshouldnotbebreakedrandomlyyouhavetocompletethelineuntiletheendasididhereWidget - TEXT
                  Text(
                    'Descripe the higlighted point here, but keep in mind to maintains fluidity in the paragraph as the lines should not be breaked randomly, you have to complete the line untile the end as I did here.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(11, 111, 186, 1),
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 2),
                  ),
                  SizedBox(height: 12),
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
                        "First highlight",
                        style: TextStyle(
                          color: Color(0xff0364ad),
                          fontSize: 16,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Descripe the higlighted point here, but keep in mind to maintains fluidity in the paragraph as the lines should not be breaked randomly, you have to complete the line untile the end as I did here.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(11, 111, 186, 1),
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 2),
                  ),
                  SizedBox(height: 12),
                  // Figma Flutter Generator Ifthereisanh2titleletisgoeshereWidget - TEXT
                  Text(
                    'If there Is An H2 Title Let is Goes Here',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(3, 100, 173, 1),
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1.9375),
                  ),
                  SizedBox(height: 5),
                  // Figma Flutter Generator SecondtitlesmallparagraphtostarterbeforehighlightingthetermofuseoritmayneedaparagraphalsodontmisstokeepitsfluidityWidget - TEXT
                  Text(
                    '''Second title small paragraph to starter before highlighting the term of use, or it may need
a paragraph, Also don’t miss to keep it’s fluidity.''',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(11, 111, 186, 1),
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 2),
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
