import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:well_shift_app/core/common/app_colors.dart';
import 'package:well_shift_app/core/common/resources.dart';
import 'package:well_shift_app/presentation/common_widgets/custom_buton.dart';
import 'package:well_shift_app/presentation/pages/journey_personalization/device_info_page.dart';
import 'package:well_shift_app/presentation/pages/onboarding/onboarding_page.dart';

class JourneyPersonalizationPage extends StatefulWidget {
  const JourneyPersonalizationPage({Key? key}) : super(key: key);

  @override
  State<JourneyPersonalizationPage> createState() =>
      _JourneyPersonalizationPageState();
}

class _JourneyPersonalizationPageState
    extends State<JourneyPersonalizationPage> {
  int selectedWellBeingPlan = 0;
  int selectedDayShift = 0;
  bool deviceConnected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.prim,
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Abeer!,\nLet's personalize your journey",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.buttonBlueColor),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Wellbeing check-in plan",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.buttonBlueColor),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: List.generate(
                        3,
                        (index) {
                          return Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedWellBeingPlan = index;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: index != 2
                                    ? EdgeInsets.only(right: 11)
                                    : null,
                                height: 34,
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
                                  border: index == selectedWellBeingPlan
                                      ? Border.all(
                                          color: AppColors.yellowColor,
                                          width: 1,
                                        )
                                      : null,
                                ),
                                child: Text(
                                  wellbeingPlan[index],
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: index == selectedWellBeingPlan
                                        ? AppColors.yellowColor
                                        : Color(0xff52A9EB),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "When do you like to do your check-in?",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.buttonBlueColor),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: dayCheckInType.map((e) {
                        int index = dayCheckInType.indexOf(e);
                        var size = MediaQuery.of(context).size;
                        var widthOfEachItem = (size.width - 66) / 3;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDayShift = index;
                            });
                          },
                          child: Padding(
                            padding: index != 2
                                ? EdgeInsets.only(right: 11)
                                : EdgeInsets.zero,
                            child: Container(
                              width: widthOfEachItem,
                              height: 96,
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
                                border: index == selectedDayShift
                                    ? Border.all(
                                        color: AppColors.yellowColor,
                                        width: 1,
                                      )
                                    : null,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Image.asset(
                                      dayCheckInType[index]['img'],
                                      width: 40,
                                      height: 40,
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      dayCheckInType[index]['title'],
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: index == selectedDayShift
                                            ? AppColors.yellowColor
                                            : Color(0xff52A9EB),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Connect with a Device?",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.buttonBlueColor,
                          ),
                        ),
                        FlutterSwitch(
                          width: 52,
                          height: 25,
                          padding: 1,
                          inactiveColor: Colors.white,
                          activeColor: Color(0xff028FC5),
                          activeToggleColor: Colors.white,
                          inactiveToggleColor: AppColors.prim,
                          value: deviceConnected,
                          onToggle: (value) {
                            setState(() {
                              deviceConnected = value;
                            });
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    deviceConnected
                        ? SizedBox(
                            height: 150,
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: connectedDevices.length,
                              itemBuilder: (contexr, index) {
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DeviceInfoPage(
                                                      deviceConnected:
                                                          deviceConnected,
                                                    )));
                                      },
                                      child: Container(
                                        height: 130,
                                        width: 120,
                                        margin: index != 0
                                            ? EdgeInsets.only(left: 20)
                                            : null,
                                        decoration: BoxDecoration(
                                          color: Color(0xffFAFBFF),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.buttonBlueColor
                                                  .withOpacity(0.2),
                                              blurRadius: 10,
                                              offset: Offset(4, 8),
                                            ),
                                          ],
                                          border: connectedDevices[index]
                                                  ['is_connected']
                                              ? Border.all(
                                                  color: AppColors.yellowColor,
                                                  width: 1,
                                                )
                                              : null,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            SvgPicture.asset(
                                              connectedDevices[index]['img'],
                                              // width: 50,
                                              // height: 50,
                                              fit: BoxFit.contain,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  connectedDevices[index]
                                                      ['title'],
                                                  style: TextStyle(
                                                    color:
                                                        connectedDevices[index]
                                                                ['is_connected']
                                                            ? AppColors
                                                                .yellowColor
                                                            : Color(0xff52A9EB),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  connectedDevices[index]
                                                      ['status'],
                                                  style: TextStyle(
                                                    color:
                                                        connectedDevices[index]
                                                                ['is_connected']
                                                            ? Color(0xff52A9EB)
                                                            : Color(0xff9A9A9A),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          )
                        : SizedBox()
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 40, top: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: IgnorePointer(
                ignoring: !deviceConnected,
                child: CustomButton(
                  text: "Continue",
                  backgroundColor: !deviceConnected ? Color(0xffDEEFFC) : AppColors.buttonBlueColor,
                  foregroundColor: !deviceConnected ? Color(0xff90CDFC) : Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OnBoardingPage(),
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
