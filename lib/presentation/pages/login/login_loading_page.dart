import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:well_shift_app/core/common/app_colors.dart';
import 'package:well_shift_app/presentation/pages/journey_personalization/journey_personalization_page.dart';

class LoginLoadingPage extends StatelessWidget {
  final String text;
  final String? imgPath;
  final String? svgPath;
  const LoginLoadingPage(
      {Key? key, required this.text, this.imgPath, this.svgPath})
      : assert(imgPath == null ? svgPath != null : true),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => JourneyPersonalizationPage()),
            (route) => false);
      });
    });
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imgPath == null
                ? SvgPicture.asset(
                    svgPath!,
                    height: 45,
                    width: 45,
                    fit: BoxFit.contain,
                  )
                : Image.asset(
                    imgPath!,
                    height: 45,
                    width: 45,
                    fit: BoxFit.contain,
                  ),
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(color: AppColors.buttonBlueColor, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
