import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:well_shift_app/core/common/app_colors.dart';
import 'package:well_shift_app/presentation/pages/dashboard/progress/widget/new_chart.dart';

class VitalSignsPage extends StatefulWidget {
  const VitalSignsPage({Key? key}) : super(key: key);

  @override
  State<VitalSignsPage> createState() => _VitalSignsPageState();
}

class _VitalSignsPageState extends State<VitalSignsPage> {
  double containerHeight = 200;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Future.delayed(Duration(microseconds: 1), () {
        setState(() {
          containerHeight = 315;
        });
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: 12,
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: containerHeight,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: Color(0x330364ad),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: ChartWidget()
          ),
          SizedBox(
            height: 16,
          ),
          _buildReportWidget("Heart rate variability ", "HRV"),
          SizedBox(
            height: 16,
          ),
          _buildReportWidget("Skin conductance level  ", "SCL"),
          SizedBox(
            height: 16,
          ),
          _buildReportWidget("Finger Temperature ", "FT"),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
  
  Container _buildReportWidget(String title, String sc) {
    return Container(
      alignment: Alignment.center,
      height: 125,
      padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Color(0x330364ad),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SvgPicture.asset("assets/images/svg/info.svg"),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: title,
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff0364AD)),
                      ),
                      TextSpan(
                        text: "($sc)",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff52A9EB)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(color: Color(0xffD6D6D6)))),
                        child: Column(
                          children: [
                            Text(
                              "200",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xffe89133),
                                fontSize: 16,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Highest",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xffe89133),
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(color: Color(0xffD6D6D6)))),
                        child: Column(
                          children: [
                            Text(
                              "138",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff66BB6A),
                                fontSize: 16,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Average",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff66BB6A),
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "76",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xffD66C5E),
                              fontSize: 16,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Lowest",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xffD66C5E),
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
