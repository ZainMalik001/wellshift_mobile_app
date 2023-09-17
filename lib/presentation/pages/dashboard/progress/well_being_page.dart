import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:well_shift_app/core/common/app_colors.dart';
import 'package:well_shift_app/core/common/app_localization.dart';
import 'package:well_shift_app/core/raw_data/progress_raw.dart';

class WellbeingPage extends StatefulWidget {
  const WellbeingPage({Key? key}) : super(key: key);

  @override
  State<WellbeingPage> createState() => _WellbeingPageState();
}

class _WellbeingPageState extends State<WellbeingPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12,),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: Color(0x330364ad),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                statWidget(context,
                    title: "resilience", progress: 86, status: "Amazing"),
                statWidget(context,
                    title: "performance", progress: 50, status: "Not Bad"),
                statWidget(context,
                    title: "wellbeing", progress: 87, status: "Wow"),
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context).translate("emotions"),
                style: TextStyle(
                  color: Color(0xff0364ad),
                  fontSize: 18,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  Text(
                    AppLocalizations.of(context).translate('daily_score'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff0364ad),
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(Icons.keyboard_arrow_down),
                  )
                ],
              ),
            ],
          ),
          GridView.builder(
            padding: const EdgeInsets.only(bottom: 20, top: 12),
            itemCount: emotions.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                childAspectRatio: 1.2558139535,
                mainAxisSpacing: 20),
            itemBuilder: (context, index) {
              return _emotionWidget(index);
            },
          ),
          Text(
            AppLocalizations.of(context).translate("suggested_for_you"),
            style: TextStyle(
              color: Color(0xff0364ad),
              fontSize: 16,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
            ),
          ),
          GridView.builder(
            padding: const EdgeInsets.only(bottom: 20, top: 12),
            itemCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                childAspectRatio: 1.2558139535,
                mainAxisSpacing: 20),
            itemBuilder: (context, index) {
              return _sugesstedWidget(index);
            },
          ),
        ],
      ),
    );
  }

  Container _sugesstedWidget(index) {
    return Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x330364ad),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(suggested_for_you[index]["image"]),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.9),
                    BlendMode.dstATop,
                  ),
                ),
                color: Color(0xfffafbff),
              ),
              child: Text(
                suggested_for_you[index]["title"],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
  }

  Container _emotionWidget(int index) {
    String getProgressText(String status) {
      if (status == 'increased') {
        return "${emotions[index].progress}% increases";
      } else if (status == 'decreased') {
        return "${emotions[index].progress}% decreases";
      } else if (status == "stable") {
        return "Stable";
      } else {
        return "";
      }
    }

    double previousProgress(int newProgress) {
      double previousProgress;
      if (emotions[index].status == "increased") {
        previousProgress = (newProgress - emotions[index].progress) / 100;
        print(previousProgress);
        return previousProgress;
      } else if (emotions[index].status == "decreased") {
        previousProgress = (newProgress + emotions[index].progress) / 100;
        print(previousProgress);
        return previousProgress;
      } else {
        // print(previousProgress = newProgress);
        return (previousProgress = newProgress.toDouble()) / 100;
      }
    }

    return Container(
      padding: EdgeInsets.all(12),
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
        children: [
          Text(
            emotions[index].title,
            style: TextStyle(
              color: Color(0xff0364ad),
              fontSize: 16,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              emotions[index].status == 'increased'
                  ? Icon(
                      Icons.arrow_upward,
                      color: Colors.green,
                    )
                  : emotions[index].status == 'decreased'
                      ? Icon(
                          Icons.arrow_downward,
                          color: Colors.red,
                        )
                      : Icon(
                          Icons.done,
                          color: Colors.orange,
                        ),
              SizedBox(
                width: 5,
              ),
              Text(
                getProgressText(emotions[index].status),
                style: TextStyle(
                  color: Color(0xff52a8ea),
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Text(
            emotions[index].total_progress.toString() + "%",
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Color(0xff0364ad),
              fontSize: 14,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            height: 8,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xffEEF5FE),
            ),
            child: Stack(
              children: [
                emotions[index].status == 'decreased'
                    ? SizedBox(
                        height: 8,
                        child: LinearProgressIndicator(
                            backgroundColor: Colors.transparent,
                            value:
                                previousProgress(emotions[index].total_progress)
                                    .toDouble(),
                            color: Color(0xffEE978C)),
                      )
                    : SizedBox(),
                SizedBox(
                  height: 8,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.transparent,
                    value: emotions[index].total_progress / 100,
                    color: emotions[index].status == 'decreased' ||
                            emotions[index].status == 'stable'
                        ? Color(0xff3C98DE)
                        : Colors.green,
                  ),
                ),
                emotions[index].status == 'increased'
                    ? SizedBox(
                        height: 8,
                        child: LinearProgressIndicator(
                            backgroundColor: Colors.transparent,
                            value:
                                previousProgress(emotions[index].total_progress)
                                    .toDouble(),
                            color: Color(0xff3C98DE)),
                      )
                    : SizedBox(),
              ],
            ),
          )
        ],
      ),
    );
  }

  ///This widget is for stats that are on the very top of the [WellbeingPage] . Here you need to pass [title], [status] and [progress] of that particular stat or might me a model having these fields
  Column statWidget(BuildContext context,
      {required String title, required String status, required int progress}) {
    return Column(
      children: [
        AutoSizeText(
          status,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromRGBO(82, 168, 234, 1),
            fontFamily: 'Poppins',
            fontSize: 16,
            letterSpacing:
                0 /*percentages not used in flutter. defaulting to zero*/,
            fontWeight: FontWeight.normal,
            height: 1.5, /*PERCENT not supported*/
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SizedBox(
              width: 48,
              height: 48,
              child: CircularProgressIndicator(
                value: progress / 100,
                backgroundColor: Color(0xffDEEFFC),
                color: Color(0xffFFBFB5),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                '$progress%',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(20, 123, 202, 1),
                  fontFamily: 'Poppins',
                  fontSize: 13,

                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.w600,
                  // height: 2.3846153846153846,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 8,
        ),
        AutoSizeText(
          AppLocalizations.of(context).translate(title),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromRGBO(20, 123, 202, 1),
            fontFamily: 'Poppins',
            fontSize: 16,
            letterSpacing:
                0 /*percentages not used in flutter. defaulting to zero*/,
            fontWeight: FontWeight.normal,
            height: 1.9375,
          ),
        )
      ],
    );
  }
}
