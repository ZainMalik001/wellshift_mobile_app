import 'package:flutter/material.dart';
import 'package:well_shift_app/core/common/app_colors.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Abeer, our support groups are for you!",
              style: TextStyle(
                color: Color(0xff0364ad),
                fontSize: 21,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Build authentic connection with others :)",
              style: TextStyle(
                color: Color(0xff0364ad).withOpacity(0.7),
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                        index == 0 ? EdgeInsets.zero : EdgeInsets.only(top: 10),
                    // width: 185,
                    padding: const EdgeInsets.only(left: 5),
                    height: 75,

                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.whiteColor,
                    ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Rejection",
                                      style: TextStyle(
                                        color: Color(0xff0364ad),
                                        fontSize: 16,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Row(
                                      
                                      children: [
                                        Icon(Icons.done, color: Color(0xffe89133), size: 15,),
                                        Text(
                                          "Joined",
                                          style: TextStyle(
                                            color: Color(0xffe89133),
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  "How to deal with Rejection?",
                                  style: TextStyle(
                                    color: Color(0xff0b6fba).withOpacity(0.65),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
