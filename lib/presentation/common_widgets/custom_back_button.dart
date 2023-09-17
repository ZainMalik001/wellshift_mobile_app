import 'package:flutter/material.dart';
import 'package:well_shift_app/core/common/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  final String title;
  final Color titleColor;
  final Widget? icon;
  final Widget? icon2;
  final Function()? icon2OnPressed;
  final Function()? iconOnPressed;
  const CustomBackButton(
      {Key? key,
      required this.title,
      this.titleColor = AppColors.yellowColor,
      this.icon,
      this.icon2,
      this.iconOnPressed,
      this.icon2OnPressed})
      : assert(icon != null ? iconOnPressed != null : true),
        assert(icon2 != null ? icon2OnPressed != null : true),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.arrow_back_ios, color: titleColor, size: 20),
              Text(
                title,
                style: TextStyle(color: titleColor),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              icon2 != null
                  ? IconButton(onPressed: icon2OnPressed, icon: icon2!)
                  : SizedBox(),
              icon !=null ? IconButton(onPressed: iconOnPressed, icon: icon!)
                  : SizedBox(),
            ],
          )
        ],
      ),
    );
  }
}
