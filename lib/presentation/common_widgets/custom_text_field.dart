import 'package:flutter/material.dart';
import 'package:well_shift_app/core/common/app_colors.dart';



class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final String? labelText;
  final Color? hintColor;
  final bool? obscureText;
  const CustomTextField({
    this.controller,
    Key? key, required this.hintText, this.labelText, this.obscureText = false,  this.hintColor
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    if (widget.obscureText != null) {
      obscureText = widget.obscureText!;
    } else {
      obscureText = false;
    }
     }
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: AppColors.buttonBlueColor),
      controller: widget.controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText:widget.hintText,
        label: Text(widget.labelText ?? ""),
        filled: true,
        fillColor: AppColors.textFieldBackgroundColor,
        labelStyle: TextStyle(
          color: AppColors.buttonBlueColor.withOpacity(0.5),
          fontSize: 16,
        ),
        hintStyle: TextStyle(
          color: AppColors.buttonBlueColor.withOpacity(0.3),
          fontSize: 16,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width:1, color: Color(0xff84AFD1)),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Color(0xff84AFD1)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Color(0xff84AFD1)),
        ),
        suffixIcon: widget.obscureText == false ? null : GestureDetector(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          
          },
          child: obscureText ? Icon(Icons.visibility_off) : Icon(Icons.visibility),)
      ),
    );
  }
}