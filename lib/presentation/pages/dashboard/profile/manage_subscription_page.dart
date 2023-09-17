import 'package:flutter/material.dart';
import 'package:well_shift_app/core/common/app_colors.dart';
import 'package:well_shift_app/presentation/common_widgets/custom_buton.dart';

import '../../../common_widgets/custom_back_button.dart';

class ManageSubscriptionPage extends StatefulWidget {
  const ManageSubscriptionPage({Key? key}) : super(key: key);

  @override
  State<ManageSubscriptionPage> createState() => _ManageSubscriptionPageState();
}

class _ManageSubscriptionPageState extends State<ManageSubscriptionPage> {
  int currSliderPage = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                CustomBackButton(title: "Profile"),
                SizedBox(
                  height: 45,
                ),
                Text(
                  "Monthly Subscription",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff0364ad),
                    fontSize: 24,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "10 of 14 days remaining from your Freemium subscription, upgrade now!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff147bca),
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Image.asset("assets/images/png/30_subs.png"),
                SizedBox(
                  height: 30,
                ),
                // SvgPicture.asset("assets/images/svg/check_mark.svg"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 4; i++)
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            color: i == currSliderPage ?AppColors.buttonBlueColor : AppColors.whiteColor, shape: BoxShape.circle),
                      ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                CustomButton(
                  height: 56,
                  text: "Start Monthly Subscription",
                ),
                SizedBox(
                  height: 32,
                ),
                Text(
                  "Only \$ 68 per month",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff147bca),
                    fontSize: 16,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Text(
                  "TERMS",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff147bca),
                    fontSize: 16,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Payment will give your account more features, and it will automatically renew Unless you canceled at least 24 hours before the current subscription.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff147bca),
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
