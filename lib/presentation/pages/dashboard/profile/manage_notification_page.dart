import 'package:flutter/material.dart';
import 'package:well_shift_app/core/common/app_colors.dart';
import 'package:well_shift_app/presentation/common_widgets/commn_switch.dart';
import 'package:well_shift_app/presentation/common_widgets/custom_back_button.dart';

class ManageNotificationPage extends StatefulWidget {
  const ManageNotificationPage({Key? key}) : super(key: key);

  @override
  State<ManageNotificationPage> createState() => _ManageNotificationPageState();
}

class _ManageNotificationPageState extends State<ManageNotificationPage> {
  bool enableNotification = true;
  bool pushNotification = true;
  bool checkInNotification = true;
  bool wellBeingJourneyStates = false;
  bool premiusStates = true;
  bool chatNotification = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              CustomBackButton(title: "Profile"),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Notifications",
                    style: TextStyle(
                      color: Color(0xff0364ad),
                      fontSize: 21,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CommonSwitch(
                      value: enableNotification,
                      onToggle: (value) {
                        setState(() {
                          enableNotification = value;
                          
                        });
                        if(!enableNotification) {
                          setState(() {
                            pushNotification = false;
                            checkInNotification = false;
                            wellBeingJourneyStates = false;
                            premiusStates = false;
                            chatNotification = false;
                          });
                        }
                      })
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Notifications time",
                    style: TextStyle(
                      color: Color(0xff147bca),
                      fontSize: 16,
                    ),
                  ),
                  // CommonSwitch(
                  //     value: enableNotification,
                  //     onToggle: (value) {
                  //       setState(() {
                  //         enableNotification = value;
                  //       });
                  //     })
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Push Notification",
                    style: TextStyle(
                      color: Color(0xff147bca),
                      fontSize: 16,
                    ),
                  ),
                  CommonSwitch(
                      value: pushNotification,
                      onToggle: (value) {
                        setState(() {
                          pushNotification = value;
                        });
                      })
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Check-in notification",
                    style: TextStyle(
                      color: Color(0xff147bca),
                      fontSize: 16,
                    ),
                  ),
                  CommonSwitch(
                      value: checkInNotification,
                      onToggle: (value) {
                        setState(() {
                          checkInNotification = value;
                        });
                      })
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Wellbeing journey states",
                    style: TextStyle(
                      color: Color(0xff147bca),
                      fontSize: 16,
                    ),
                  ),
                  CommonSwitch(
                      value: wellBeingJourneyStates,
                      onToggle: (value) {
                        setState(() {
                          wellBeingJourneyStates = value;
                        });
                      })
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Premium states",
                    style: TextStyle(
                      color: Color(0xff147bca),
                      fontSize: 16,
                    ),
                  ),
                  CommonSwitch(
                      value: premiusStates,
                      onToggle: (value) {
                        setState(() {
                          premiusStates = value;
                        });
                      })
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Chat notification",
                    style: TextStyle(
                      color: Color(0xff147bca),
                      fontSize: 16,
                    ),
                  ),
                  CommonSwitch(
                      value: chatNotification,
                      onToggle: (value) {
                        setState(() {
                          chatNotification = value;
                        });
                      })
                ],
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
