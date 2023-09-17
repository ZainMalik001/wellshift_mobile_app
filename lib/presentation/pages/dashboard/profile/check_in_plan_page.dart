import 'package:flutter/material.dart';
import 'package:well_shift_app/core/common/resources.dart';

import '../../../../core/common/app_colors.dart';
import '../../../common_widgets/custom_back_button.dart';

class CheckInPlanPage extends StatefulWidget {
  const CheckInPlanPage({Key? key}) : super(key: key);

  @override
  State<CheckInPlanPage> createState() => _CheckInPlanPageState();
}

class _CheckInPlanPageState extends State<CheckInPlanPage> {
   int selectedWellBeingPlan = 0;
  int selectedDayShift = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomBackButton(title: "Profile"),
              SizedBox(
                height: 10,
              ),
              Text(
                "Check-in plan",
                style: TextStyle(
                  color: Color(0xff0364ad),
                  fontSize: 21,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(
                height: 20,
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
            ],
          ),
        ),
      ),
    );
  }
}
