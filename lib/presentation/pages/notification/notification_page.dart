import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:well_shift_app/core/common/app_colors.dart';
import 'package:well_shift_app/core/raw_data/notification_raw.dart';
import 'package:well_shift_app/presentation/common_widgets/custom_back_button.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: CustomBackButton(
                title: 'Back',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                "Notifications",
                style: TextStyle(
                  color: Color(0xff0364ad),
                  fontSize: 21,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),

            /// this list is from lib/core/raw_data/notification_raw.dart
            /// you can add your own data here
            /// model is from lib/data/model/notification/notification_model.dart
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              itemCount: notificationraw.length,
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      index == 0 ? EdgeInsets.zero : EdgeInsets.only(top: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  height: 72,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      SvgPicture.asset(notificationraw[index].image),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Text(
                          notificationraw[index].message,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(11, 111, 186, 1),
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1.5,
                          ),
                        ),
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                             notificationraw[index].time,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Color(0xff707070).withOpacity(0.65),
                                  fontSize: 14,
                              ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
