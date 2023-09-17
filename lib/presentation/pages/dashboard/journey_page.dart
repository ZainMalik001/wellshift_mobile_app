import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:well_shift_app/core/common/app_colors.dart';

/// This is the journey page
class JourneyPage extends StatefulWidget {
  const JourneyPage({Key? key}) : super(key: key);

  @override
  State<JourneyPage> createState() => _JourneyPageState();
}

class _JourneyPageState extends State<JourneyPage> {
  int journeyCompleted = 0;
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
              SizedBox(
                height: 10,
              ),
              Text(
                "Wellbeing journey",
                style: TextStyle(
                  color: Color(0xff0364ad),
                  fontSize: 21,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        height: 120,
                        padding: const EdgeInsets.all(12),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x330364ad),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                          color: Color(0xfffafbff),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                    "assets/images/svg/process.svg"),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Stations",
                                  style: TextStyle(
                                    color: Color(0xff0364ad),
                                    fontSize: 16,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                            Row(children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "6",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xff0364ad),
                                        fontSize: 18,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "Total",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xff52a8ea),
                                        fontSize: 14,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "6",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xff0364ad),
                                        fontSize: 18,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "Remaining",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xff52a8ea),
                                        fontSize: 14,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "25 min",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xff0364ad),
                                        fontSize: 18,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "Est. time",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xff52a8ea),
                                        fontSize: 14,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ])
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      /// This is the journey progress bar
                      /// It will be updated as the journey progresses
                      /// on Tap of each journey station button it opens certain pages of that particular journey
                      /// after the journey is completed it should update the journey completed count
                      /// For now I have used local variables to update the journey completed count
                      /// onTap of journey stations journeyCompleted variable is updating to the value of that particular journey
                      /// here also [IgnorePointer] is checking the previous journeycompleted value and ignoring the ontap button if it is true
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: Color(0xffe89133),
                                width: 8,
                              ),
                              color: Color(0xffbbdef9),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: SizedBox(
                              height: 24,
                              child: VerticalDivider(
                                color: Color(0xffE89133),
                                thickness: 5,
                                width: 5,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Divider(
                                  color: Color(0xff84AFD1),
                                  thickness: 5,
                                  height: 5,
                                ),
                                Divider(
                                  color: Color(0xffE89133),
                                  thickness: 5,
                                  height: 5,
                                  indent: 0,
                                  endIndent: journeyCompleted > 0 ? 0 : 100,
                                ),
                                journeyCompleted > 0 ? SizedBox(): Positioned(
                                  right: 100,
                                  bottom: -4,
                                  // width: 16,
                                  child: Container(
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color(0xffe89133),
                                    ),
                                  ),
                                ) ,
                                journeyCompleted > 0 ? SizedBox(): Positioned(
                                  right: 80,
                                  bottom: 20,
                                  // width: 16,
                                  child: Text(
                                    "2/6 Q. Done",
                                    style: TextStyle(
                                      color: Color(0xffe89133),
                                      fontSize: 12,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: SizedBox(
                                    height: 100,
                                    child: VerticalDivider(
                                      color: journeyCompleted > 1? Color(0xffe89133): Color(0xff84AFD1),
                                      thickness: 5,
                                      width: 5,
                                    ),
                                  ),
                                ),
                              ),
                              journeyCompleted > 0 ?  Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: SizedBox(
                                    height: 50,
                                    child: VerticalDivider(
                                      color: Color(0xffe89133),
                                      thickness: 5,
                                      width: 5,
                                    ),
                                  ),
                                ),
                              ) : SizedBox(),
                              Positioned(
                                top: 30,
                                right: -1,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/svg/star.svg",
                                      color: journeyCompleted > 0 ? Color(0xffE89133) : null,
                                    ),
                                    Text(
                                      "1",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: journeyCompleted > 0 ? AppColors.whiteColor :  Color(0xff028fc5),
                                        fontSize: 18,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 30,
                                right: 50,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      journeyCompleted = 1;
                                    });
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Self-discovery journey",
                                        style: TextStyle(
                                          color: Color(0xff0364ad),
                                          fontSize: 16,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.70,
                                        child: Text(
                                          "6 Questions",
                                          style: TextStyle(
                                            color: Color(0xff0364ad),
                                            fontSize: 14,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Divider(
                              color: journeyCompleted > 1 ? Color(0xffe89133): Color(0xff84AFD1),
                              thickness: 5,
                              height: 5,
                            ),
                          ),
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: SizedBox(
                                    height: 100,
                                    child: VerticalDivider(
                                      color: journeyCompleted > 2 ? Color(0xffe89133): Color(0xff84AFD1),
                                      thickness: 5,
                                      width: 5,
                                    ),
                                  ),
                                ),
                              ),
                              journeyCompleted > 1 ?  Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: SizedBox(
                                    height: 50,
                                    child: VerticalDivider(
                                      color: Color(0xffe89133),
                                      thickness: 5,
                                      width: 5,
                                    ),
                                  ),
                                ),
                              ) : SizedBox(),
                              Positioned(
                                top: 30,
                                left: -1,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/svg/star.svg",
                                      color: journeyCompleted > 1 ? Color(0xffe89133) : null
                                    ),
                                    Text(
                                      "2",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: journeyCompleted > 1 ? AppColors.whiteColor : Color(0xff028fc5),
                                        fontSize: 18,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                               Positioned(
                                top: 30,
                                left: 50,
                                child: IgnorePointer(
                                  ignoring: journeyCompleted == 1 ? false : true,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        journeyCompleted = 2;
                                      });
                                    
                                    },
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Emotional Agility",
                                          style: TextStyle(
                                            color: Color(0xff0364ad),
                                            fontSize: 16,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Opacity(
                                          opacity: 0.70,
                                          child: Text(
                                            "5 Questions",
                                            style: TextStyle(
                                              color: Color(0xff0364ad),
                                              fontSize: 14,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Divider(
                              color: journeyCompleted > 2? Color(0xffe89133): Color(0xff84AFD1),
                              thickness: 5,
                              height: 5,
                            ),
                          ),
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: SizedBox(
                                    height: 100,
                                    child: VerticalDivider(
                                      color: journeyCompleted > 3 ? Color(0xffe89133): Color(0xff84AFD1),
                                      thickness: 5,
                                      width: 5,
                                    ),
                                  ),
                                ),
                              ),
                              journeyCompleted > 2 ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: SizedBox(
                                    height: 50,
                                    child: VerticalDivider(
                                      color: Color(0xffe89133),
                                      thickness: 5,
                                      width: 5,
                                    ),
                                  ),
                                ),
                              ): SizedBox(),
                              Positioned(
                                top: 30,
                                right: -1,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/svg/star.svg",
                                      color: journeyCompleted > 2 ? Color(0xffe89133) : null
                                    ),
                                    Text(
                                      "3",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: journeyCompleted > 2 ?AppColors.whiteColor : Color(0xff028fc5),
                                        fontSize: 18,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 30,
                                right: 50,
                                child: IgnorePointer(
                                  ignoring: journeyCompleted == 2 ? false : true,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        journeyCompleted = 3;
                                      });
                                    },
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Wise Mindset",
                                          style: TextStyle(
                                            color: Color(0xff0364ad),
                                            fontSize: 16,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Opacity(
                                          opacity: 0.70,
                                          child: Text(
                                            "7 Questions",
                                            style: TextStyle(
                                              color: Color(0xff0364ad),
                                              fontSize: 14,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Divider(
                              color: journeyCompleted > 3 ? Color(0xffe89133):  Color(0xff84AFD1),
                              thickness: 5,
                              height: 5,
                            ),
                          ),
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: SizedBox(
                                    height: 100,
                                    child: VerticalDivider(
                                      color: journeyCompleted > 4 ? Color(0xffe89133) :Color(0xff84AFD1),
                                      thickness: 5,
                                      width: 5,
                                    ),
                                  ),
                                ),
                              ),
                              journeyCompleted > 3 ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: SizedBox(
                                    height: 50,
                                    child: VerticalDivider(
                                      color: Color(0xffe89133),
                                      thickness: 5,
                                      width: 5,
                                    ),
                                  ),
                                ),
                              ): SizedBox(),
                              Positioned(
                                top: 30,
                                left: -1,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/svg/star.svg",
                                      color: journeyCompleted > 3 ? Color(0xffe89133) : null
                                    ),
                                    Text(
                                      "4",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: journeyCompleted > 3 ? AppColors.whiteColor: Color(0xff028fc5),
                                        fontSize: 18,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 30,
                                left: 50,
                                child: IgnorePointer(
                                  ignoring: journeyCompleted == 3 ? false : true,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        journeyCompleted = 4;
                                      
                                      });
                                    },
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Heart intelligence",
                                          style: TextStyle(
                                            color: Color(0xff0364ad),
                                            fontSize: 16,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Opacity(
                                          opacity: 0.70,
                                          child: Text(
                                            "6 Questions",
                                            style: TextStyle(
                                              color: Color(0xff0364ad),
                                              fontSize: 14,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Divider(
                              color: journeyCompleted > 4 ? Color(0xffe89133): Color(0xff84AFD1),
                              thickness: 5,
                              height: 5,
                            ),
                          ),
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: SizedBox(
                                    height: 100,
                                    child: VerticalDivider(
                                      color: journeyCompleted > 5 ? Color(0xffe89133): Color(0xff84AFD1),
                                      thickness: 5,
                                      width: 5,
                                    ),
                                  ),
                                ),
                              ),
                              journeyCompleted > 4 ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: SizedBox(
                                    height: 50,
                                    child: VerticalDivider(
                                      color: journeyCompleted > 4 ? Color(0xffe89133): Color(0xff84AFD1),
                                      thickness: 5,
                                      width: 5,
                                    ),
                                  ),
                                ),
                              ): SizedBox(),
                              Positioned(
                                top: 30,
                                right: -1,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/svg/star.svg",
                                      color: journeyCompleted > 4 ? Color(0xffe89133) : null
                                    ),
                                    Text(
                                      "5",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: journeyCompleted > 4 ? AppColors.whiteColor : Color(0xff028fc5),
                                        fontSize: 18,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 30,
                                right: 50,
                                child: IgnorePointer(
                                  ignoring: journeyCompleted == 4 ? false : true,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        journeyCompleted = 5;
                                      });
                                    },
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Your Edges",
                                          style: TextStyle(
                                            color: Color(0xff0364ad),
                                            fontSize: 16,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Opacity(
                                          opacity: 0.70,
                                          child: Text(
                                            "3 cases",
                                            style: TextStyle(
                                              color: Color(0xff0364ad),
                                              fontSize: 14,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Divider(
                              color: journeyCompleted > 5? Color(0xffe89133): Color(0xff84AFD1),
                              thickness: 5,
                              height: 5,
                            ),
                          ),
                          SizedBox(
                            height: 100,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: SizedBox(
                                      height: 50,
                                      child: VerticalDivider(
                                        color: journeyCompleted > 5 ? Color(0xffe89133):Color(0xff84AFD1),
                                        thickness: 5,
                                        width: 5,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 30,
                                  left: -1,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/images/svg/star.svg",
                                        color: journeyCompleted > 5 ? Color(0xffe89133) : null
                                      ),
                                      Text(
                                        "6",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color:journeyCompleted >5 ? AppColors.whiteColor : Color(0xff028fc5),
                                          fontSize: 18,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                top: 30,
                                left: 50,
                                child: IgnorePointer(
                                  ignoring: journeyCompleted == 5 ? false : true,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        journeyCompleted = 6;
                                      });
                                    
                                    },
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Your Trajectory",
                                          style: TextStyle(
                                            color: Color(0xff0364ad),
                                            fontSize: 16,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Opacity(
                                          opacity: 0.70,
                                          child: Text(
                                            "3 Questions",
                                            style: TextStyle(
                                              color: Color(0xff0364ad),
                                              fontSize: 14,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
