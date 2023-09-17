import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:well_shift_app/core/common/app_colors.dart';
import 'package:well_shift_app/core/raw_data/my_profile_raw.dart';
import 'package:well_shift_app/presentation/common_widgets/custom_back_button.dart';
import 'package:well_shift_app/presentation/common_widgets/custom_dialog.dart';
import 'package:well_shift_app/presentation/common_widgets/custom_text_field.dart';
import 'package:well_shift_app/presentation/pages/login/login_page.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  TextEditingController _nameController =
      TextEditingController(text: "Abeer Albashiti");
  TextEditingController _emailController =
      TextEditingController(text: "Abeer@Albash.com");
  TextEditingController _phoneController =
      TextEditingController(text: "123456789");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(title: "Profile"),
                  Text(
                    "Save",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff028fc5),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 95,
                        width: 95,
                        child: Stack(
                          children: [
                            Container(
                              width: 88,
                              height: 88,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0x19078491),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                    "assets/images/svg/account.svg",
                                    height: 32,
                                    width: 32,
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Opacity(
                                  opacity: 0.70,
                                  child: Container(
                                    width: 36,
                                    height: 36,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Color(0xff79abdc),
                                        width: 1,
                                      ),
                                      color: Color(0xffedf6ff),
                                    ),
                                    child: Icon(Icons.camera_enhance,
                                        color: Color(0xff028FC5), size: 16),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Use avatar",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff028fc5),
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 30),
                      CustomTextField(
                        labelText: "Name",
                        hintText: "Your name",
                        controller: _nameController,
                      ),
                      SizedBox(height: 12),
                      CustomTextField(
                        labelText: "Email",
                        hintText: "Your email",
                        controller: _emailController,
                      ),
                      SizedBox(height: 12),
                      CustomTextField(
                        labelText: "Phone Number",
                        hintText: "Your email",
                        controller: _phoneController,
                      ),
                      SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.textFieldBackgroundColor),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Relatives/friends name",
                                    style: TextStyle(
                                      color: Color(0x7f014fc5),
                                      fontSize: 14,
                                    ),
                                  ),
                                  Icon(
                                    Icons.add,
                                    color: Color(0xff147CCB),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Opacity(
                              opacity: 0.75,
                              child: Text(
                                "Friends",
                                style: TextStyle(
                                  color: Color(0xff0364ad),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Wrap(
                                children: friendList.map((friend) {
                              int index = friendList.indexOf(friend);
                              return Container(
                                margin:
                                    const EdgeInsets.only(right: 8, bottom: 8),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                decoration: BoxDecoration(
                                  color: Color(0xffF7FCFE),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      friendList[index],
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Color.fromRGBO(75, 102, 113, 1),
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(
                                      Icons.close,
                                      color: Color(0xff147CCB),
                                      size: 20,
                                    )
                                  ],
                                ),
                              );
                            }).toList()),
                            SizedBox(
                              height: 8,
                            ),
                            Opacity(
                              opacity: 0.75,
                              child: Text(
                                "Family",
                                style: TextStyle(
                                  color: Color(0xff0364ad),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Wrap(
                              children: friendList.map((friend) {
                                int index = friendList.indexOf(friend);
                                return Container(
                                  margin: const EdgeInsets.only(
                                      right: 8, bottom: 8),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 8),
                                  decoration: BoxDecoration(
                                    color: Color(0xffF7FCFE),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        friendList[index],
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(75, 102, 113, 1),
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Icon(
                                        Icons.close,
                                        color: Color(0xff147CCB),
                                        size: 20,
                                      )
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      Row(
                        children: [
                          Text(
                            "Best way of contact",
                            style: TextStyle(
                              color: Color(0xff0364ad),
                              fontSize: 16,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          _socialProfileLinkWidget(
                              "assets/images/png/twitter.png"),
                          SizedBox(width: 16),
                          _socialProfileLinkWidget(
                              "assets/images/png/facebook.png"),
                          SizedBox(width: 16),
                          _socialProfileLinkWidget(
                              "assets/images/png/instagram.png"),
                          SizedBox(width: 16),
                          _socialProfileLinkWidget(
                              "assets/images/png/linkedin.png"),
                          SizedBox(width: 16),
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Color(0xffF7FCFE),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 32),
                      GestureDetector(
                        onTap: () {
                          // CommonDialog
                          showCommonDialog(
                            context,
                            title: "You are Logging out",
                            description:
                                'You will not be able to check your Wellbeing until you login!',
                            buttonText2: "Log out",
                            svgPath: "assets/images/svg/logout.svg",
                            buttonText1: "Don't Log out",
                            onTapButton2: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                  (route) => false);
                            },
                          );
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/images/svg/logout.svg"),
                            SizedBox(width: 10),
                            Text(
                              "Log out",
                              style: TextStyle(
                                color: Color(0xfff24d57),
                                fontSize: 16,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// This is common method to create social profile link widget
  /// [svgPath] is the path of the icon
  /// more about this is to be discussed with abeer and adnan
  Container _socialProfileLinkWidget(String pngPath) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xffF7FCFE),
        image: DecorationImage(
          image: AssetImage(
            pngPath,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
