import 'package:flutter/material.dart';
import 'package:well_shift_app/core/common/app_colors.dart';
import 'package:well_shift_app/presentation/common_widgets/custom_back_button.dart';
import 'package:well_shift_app/presentation/common_widgets/custom_buton.dart';
import 'package:well_shift_app/presentation/common_widgets/custom_dialog.dart';
import 'package:well_shift_app/presentation/pages/dashboard/dashboard_page.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late PageController controller;
  @override
  void initState() {
    super.initState();
    controller = PageController(
      initialPage: 0,
    );
  }

  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(
                    title: "Back",
                  ),
                  currentPage != 0
                      ? Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '${currentPage}/12',
                                  style: TextStyle(
                                      color: AppColors.yellowColor,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                            CircularProgressIndicator(
                              value: currentPage / 12,
                              backgroundColor: Colors.transparent,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.yellowColor),
                            )
                          ],
                        )
                      : SizedBox()
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  // setState(() {
                  //   controller.animateTo(index.toDouble(), duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                  // });
                  setState(() {
                    currentPage = index;
                  });
                },
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 280,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/png/onboard.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              height: 42,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(100, 144, 205, 252),
                                  borderRadius: BorderRadius.circular(6)),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "12 questions",
                                          style: TextStyle(
                                              color: AppColors.brownColor
                                                  .withOpacity(0.7),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  VerticalDivider(
                                    color: AppColors.textLightBlueColor,
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.alarm,
                                          color: AppColors.brownColor,
                                          size: 16,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "5 min",
                                          style: TextStyle(
                                              color: AppColors.brownColor
                                                  .withOpacity(0.7),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Text(
                              "Onboarding",
                              style: TextStyle(
                                color: AppColors.buttonBlueColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "You will answer 12 questions that support your wellbeing assessment & tailored recommendations.",
                              style: TextStyle(
                                color: AppColors.textLightBlueColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  for (int i = 0; i < 12; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Text(
                            "Rate your acceptance of life changes",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: AppColors.buttonBlueColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Expanded(
                            child: Column(
                                children: List.generate(5, (index) {
                              return Container(
                                alignment: Alignment.center,
                                margin: index != 4
                                    ? EdgeInsets.only(bottom: 20)
                                    : EdgeInsets.zero,
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xffFAFBFF),
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.buttonBlueColor
                                          .withOpacity(0.2),
                                      blurRadius: 10,
                                      offset: Offset(4, 8),
                                    ),
                                  ],
                                ),
                                child: Text(
                                  "Great",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: AppColors.buttonBlueColor,
                                      fontWeight: FontWeight.w500),
                                ),
                              );
                            })),
                          ),
                          currentPage == 12
                              ? CustomButton(
                                  text: "Done",
                                  onPressed: () {
                                    showCommonDialog(
                                      context,
                                      svgPath: 'assets/images/svg/dialog.svg',
                                      title:
                                          "Wow, Onboarding Assessment has been completed",
                                      description:
                                          "Let us start your Wellbeing journey",
                                      buttonText2: "Wellbeing journey",
                                      onTapButton2: () {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => DashboardPage(pageNo: 1,)
                                          ),
                                          ((route) => false),
                                        );
                                      },
                                      onTapButton1: () {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DashboardPage(),
                                          ),
                                          ((route) => false),
                                        );
                                      },
                                    );
                                  },
                                )
                              : SizedBox()
                        ],
                      ),
                    )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    currentPage == 0
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_back,
                                color: Color(0xff82AAC8),
                                size: 12,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Swipe and Start",
                                style: TextStyle(
                                    color: Color(0xff82AAC8),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        13,
                        (index) => index == 0
                            ? Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.home,
                                  size: 15,
                                  color: index == currentPage
                                      ? AppColors.yellowColor
                                      : AppColors.yellowColor.withOpacity(0.2),
                                ),
                              )
                            : Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: index == currentPage
                                      ? AppColors.brownColor
                                      : AppColors.brownColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                margin: EdgeInsets.only(right: 10),
                              ),
                      ),
                    )
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
