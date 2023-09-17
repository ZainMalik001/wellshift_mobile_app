import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:well_shift_app/core/common/app_colors.dart';
import 'package:well_shift_app/presentation/common_widgets/terms_privacy_widget.dart';
import 'package:well_shift_app/presentation/pages/dashboard/profile/check_in_plan_page.dart';
import 'package:well_shift_app/presentation/pages/dashboard/profile/device_connection_page.dart';
import 'package:well_shift_app/presentation/pages/dashboard/profile/faq_page.dart';
import 'package:well_shift_app/presentation/pages/dashboard/profile/manage_language_page.dart';
import 'package:well_shift_app/presentation/pages/dashboard/profile/manage_notification_page.dart';
import 'package:well_shift_app/presentation/pages/dashboard/profile/manage_subscription_page.dart';
import 'package:well_shift_app/presentation/pages/dashboard/profile/my_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 132,
          width: double.infinity,
          color: AppColors.whiteColor,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Container(
                    height: 56,
                    width: 56,
                    padding: EdgeInsets.all(12),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xffE4EFF3)),
                    child: SvgPicture.asset(
                      "assets/images/svg/account.svg",
                      height: 20,
                      width: 20,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Hi, Abeer!",
                        style: TextStyle(
                          color: Color(0xff0f629f),
                          fontSize: 21,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/images/svg/free_subs.svg"),
                          SizedBox(width: 10),
                          Text(
                            "Free Subscriptions",
                            style: TextStyle(
                              color: Color(0xfffe8c00),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: SizedBox(
                    height: 24,
                    child: Opacity(
                      opacity: 0.90,
                      child: Text(
                        "Account",
                        style: TextStyle(
                          color: Color(0xff0364ad),
                          fontSize: 13,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  color: AppColors.whiteColor,
                  child: Column(
                    children: [
                      _profileTab(
                        "my_profile.svg",
                        "My Profile",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyProfile(),
                              ));
                        },
                      ),
                      _profileTab("device_connection.svg", "Device Connection",
                          subtitle: "Connected", onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DeviceConnectionPage(),
                            ));
                      }),
                      _profileTab(
                        "manage_subscription.svg",
                        "Manage Subscription",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ManageSubscriptionPage(),
                              ));
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: SizedBox(
                    height: 24,
                    child: Opacity(
                      opacity: 0.90,
                      child: Text(
                        "Settings".toUpperCase(),
                        style: TextStyle(
                          color: Color(0xff0364ad),
                          fontSize: 13,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  color: AppColors.whiteColor,
                  child: Column(
                    children: [
                      _profileTab("notification.svg", "Notifications",
                          onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ManageNotificationPage(),
                            ));
                      }),
                      _profileTab("check_in_plan.svg", "Check-in plan",
                          onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckInPlanPage(),
                            ));
                      }),
                      _profileTab("language.svg", "Language",
                          subtitle: "English", isLanguage: true, onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChooseLanguagePage(),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: SizedBox(
                    height: 24,
                    child: Opacity(
                      opacity: 0.90,
                      child: Text(
                        "Support".toUpperCase(),
                        style: TextStyle(
                          color: Color(0xff0364ad),
                          fontSize: 13,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  color: AppColors.whiteColor,
                  child: Column(
                    children: [
                      _profileTab(
                        "fqa.svg",
                        "FAQ",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FAQPage(),
                              ));
                        },
                      ),
                      _profileTab("privacy_policy.svg", "Privacy policy",
                          onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TermsOrPrivacy(
                                      title: "Privacy Policy",
                                      backButtonTitle: "Profile",
                                    )));
                      }),
                      _profileTab("info.svg", "Terms of service ", onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TermsOrPrivacy(
                                title: "Terms of service",
                                backButtonTitle: "Profile",
                              ),
                            ));
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// This is the widget used in this profile page for showing different items in the page
  GestureDetector _profileTab(String svgImage, String title,
      {bool isLanguage = false, String? subtitle, Null Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/images/svg/$svgImage",
                ),
                SizedBox(
                  width: 16,
                ),
                SizedBox(
                  height: 24,
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Color(0xff0364ad),
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  subtitle ?? "",
                  style: TextStyle(
                    color: Color(0xff81b1d6),
                    fontSize: 14,
                  ),
                ),
                isLanguage
                    ? Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xff616161),
                        size: 15,
                      )
                    : SizedBox()
              ],
            )
          ],
        ),
      ),
    );
  }
}
