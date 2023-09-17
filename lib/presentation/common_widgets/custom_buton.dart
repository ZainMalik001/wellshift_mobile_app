import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:well_shift_app/core/common/app_colors.dart';

/// Custom butoon which takes minimum available space
/// If [height] and [width] are passed it changes accordingly

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final String? iconPath;
  final String? svgPath;
  final Color? backgroundColor;
  final Color? foregroundColor;
  const CustomButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.width,
    this.height = 44,
    this.textStyle,
    this.svgPath,
    this.iconPath, this.backgroundColor = AppColors.buttonBlueColor, this.foregroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          foregroundColor: MaterialStateProperty.all(foregroundColor),

        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconPath == null
                ? svgPath == null ? SizedBox() : SvgPicture.asset(
                    svgPath!,
                    height: 20,
                    width: 20,
                    fit: BoxFit.contain,
                  ): Image.asset(
                    iconPath!,
                    height: 20,
                    width: 20,
                    fit: BoxFit.contain,
                  ),
            iconPath == null  && svgPath == null 
                ? SizedBox() : SizedBox(width: 20),
            Text(
              text,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
