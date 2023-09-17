import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:well_shift_app/core/common/app_colors.dart';
import 'package:well_shift_app/presentation/common_widgets/custom_back_button.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({Key? key}) : super(key: key);

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  RangeValues values = RangeValues(0, 3);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff0364AD),
              Color(0xff002139),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                CustomBackButton(
                  title: "Recommendations",
                  titleColor: AppColors.primaryColor,
                  icon: Icon(
                    Icons.info,
                    color: AppColors.primaryColor,
                  ),
                  iconOnPressed: () {},
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Let yourself be drawn by the stronger pull of that which you truly love.",
                  style: TextStyle(
                    color: Color(0xffbbdef9),
                    fontSize: 18,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Believer",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xffbbdef9),
                    fontSize: 18,
                  ),
                ),
                Opacity(
                  opacity: 0.70,
                  child: Text(
                    "Imagine Dragons",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xffa7cdea),
                      fontSize: 14,
                    ),
                  ),
                ),
                LinearProgressIndicator(
                  value: 0.3,
                  
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
