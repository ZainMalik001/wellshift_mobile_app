import 'package:flutter/material.dart';
import 'package:well_shift_app/core/common/app_colors.dart';
import 'package:well_shift_app/core/raw_data/recommend_raw.dart';
import 'package:well_shift_app/presentation/pages/chat/chat_detail_page.dart';
import 'package:well_shift_app/presentation/pages/dashboard/recommend/for_you_detail.dart';
import 'package:well_shift_app/presentation/pages/music/music_page.dart';

class RecommendPage extends StatelessWidget {
  const RecommendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Recommendations",
              style: TextStyle(
                color: Color(0xff0364ad),
                fontSize: 21,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Opacity(
              opacity: 0.70,
              child: Text(
                "You can find tailored recommendations collected for you ;)",
                style: TextStyle(
                  color: Color(0xff0364ad),
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "For you",
              style: TextStyle(
                color: Color(0xff0364ad),
                fontSize: 16,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 180,
              child: ListView.builder(
                itemCount: 2,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForYouDetail(),
                        ),
                      );
                    },
                    child: Container(
                      margin: index == 0
                          ? EdgeInsets.zero
                          : EdgeInsets.only(left: 10),
                      clipBehavior: Clip.antiAlias,
                      width: 250,
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/png/static/for_you.png"),
                            fit: BoxFit.cover),
                      ),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            alignment: Alignment.bottomLeft,
                            padding: const EdgeInsets.all(12),
                            height: 66,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xff000000).withOpacity(0),
                                    Color(0xff147CCB).withOpacity(0.01),
                                    Color(0xff0364AD).withOpacity(0.56),
                                  ],
                                  stops: [
                                    0,
                                    0,
                                    1
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                            ),
                            child: Text(
                              "Bubble Blowing ",
                              style: TextStyle(
                                color: Color(0xffdeeffc),
                                fontSize: 16,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
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
              "Boost your wellbeing",
              style: TextStyle(
                color: Color(0xff0364ad),
                fontSize: 16,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 130,
              child: ListView.builder(
                itemCount: boost.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MusicPage(),
                        ),
                      );
                    },
                    child: Container(
                      margin: index == 0
                          ? EdgeInsets.zero
                          : EdgeInsets.only(left: 10),
                      clipBehavior: Clip.antiAlias,
                      width: 160,
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        image: DecorationImage(
                            image: AssetImage(boost[index]["image"]),
                            fit: BoxFit.cover),
                      ),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            alignment: Alignment.bottomLeft,
                            padding: const EdgeInsets.all(12),
                            height: 66,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xff000000).withOpacity(0),
                                    Color(0xff147CCB).withOpacity(0.01),
                                    Color(0xff0364AD).withOpacity(0.56),
                                  ],
                                  stops: [
                                    0,
                                    0,
                                    1
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                            ),
                            child: Text(
                              "Bubble Blowing ",
                              style: TextStyle(
                                color: Color(0xffdeeffc),
                                fontSize: 16,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Connect with people Like you",
              style: TextStyle(
                color: Color(0xff0364ad),
                fontSize: 16,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 70,
              child: ListView.builder(
                itemCount: boost.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatDetail(name: "Alisa",)));
                    },
                    child: Container(
                      margin: index == 0
                          ? EdgeInsets.zero
                          : EdgeInsets.only(left: 10),
                      width: 185,
                      padding: const EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                          color: AppColors.buttonBlueColor.withOpacity(0.17),
                          borderRadius: BorderRadius.circular(6)),
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: AppColors.buttonBlueColor,
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Alisa",
                                  style: TextStyle(
                                    color: Color(0xff0364ad),
                                    fontSize: 14,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "Rejection ",
                                  style: TextStyle(
                                    color: Color(0xffdeeffc),
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
