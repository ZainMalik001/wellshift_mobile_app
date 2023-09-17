import 'package:flutter/material.dart';
import 'package:well_shift_app/core/common/app_colors.dart';
import 'package:well_shift_app/presentation/pages/intro_page/intro_page.dart';

/// Splash page
/// Here in the [initState] method after delay of 3 seconds it is redirected to [IntroPage]
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const IntroPage()), (route) => false);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset("assets/images/png/Group 266.png"),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/png/larimar.png"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
