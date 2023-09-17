import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:well_shift_app/core/common/app_colors.dart';
import 'package:well_shift_app/core/common/app_localization.dart';
import 'package:well_shift_app/presentation/pages/dashboard/progress/vital_signs_page.dart';
import 'package:well_shift_app/presentation/pages/dashboard/progress/well_being_page.dart';
import 'package:well_shift_app/presentation/pages/notification/notification_page.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  int selectedIndex = 0;
  List pages = [
    WellbeingPage(),
    VitalSignsPage()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 16,
          right: 16,
        ),
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context).translate("good_morning") +
                        ", Abeer!",
                    style: TextStyle(
                      color: Color(0xff0364ad).withOpacity(0.9),
                      fontSize: 18,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationPage()));
                        },
                        icon: Icon(
                          Icons.notifications_outlined,
                          color: Color(0xff0364ad).withOpacity(0.9),
                        ),
                      ),
                      selectedIndex == 1
                          ? IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset("assets/images/svg/settings.svg"))
                          : SizedBox()
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                height: 52,
                clipBehavior: Clip.antiAlias,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.whiteColor.withOpacity(0.9)),
                child: TabBar(
                  padding: const EdgeInsets.all(6),
                  indicator: BoxDecoration(
                      color: AppColors.buttonBlueColor,
                      borderRadius: BorderRadius.circular(6)),
                  labelColor: Colors.white,
                  unselectedLabelColor: Color(0xff147CCB),
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  tabs: [
                    Text(
                      AppLocalizations.of(context).translate("wellbeing"),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1.9375,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context).translate("vital_sign"),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1.9375,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Expanded(
                child: pages[selectedIndex]
              ),
            ],
          ),
        ),
      ),
    );
  }
}
