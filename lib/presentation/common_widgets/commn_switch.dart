import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:well_shift_app/core/common/app_colors.dart';

/// This class is used to create a switch button
/// This common switch whereevr we need to create a switch button

class CommonSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onToggle;
  const CommonSwitch({Key? key, required this.value, required this.onToggle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      width: 40,
      height: 20,
      padding: 4,
      toggleSize: 12,
      inactiveColor: Colors.white,
      activeColor: Color(0xffC26A0A),
      activeToggleColor: Colors.white,
      inactiveToggleColor: AppColors.prim,
      value: value,
      onToggle: onToggle,
    );
  }
}
