import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:well_shift_app/core/common/app_colors.dart';
import 'package:well_shift_app/presentation/common_widgets/custom_back_button.dart';

class DeviceInfoPage extends StatefulWidget {
  final bool deviceConnected;
  const DeviceInfoPage({Key? key, required this.deviceConnected})
      : super(key: key);

  @override
  State<DeviceInfoPage> createState() => _DeviceInfoPageState();
}

class _DeviceInfoPageState extends State<DeviceInfoPage> {
  bool deviceConnected = false;
  @override
  void initState() {
    super.initState();
    deviceConnected = widget.deviceConnected;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomBackButton(title: "Back"),
             
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your device",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                      color: AppColors.buttonBlueColor,
                    ),
                  ),
                  FlutterSwitch(
                    width: 40,
                    height: 20,
                    padding: 4,
                    toggleSize: 12,
                    inactiveColor: Colors.white,
                    activeColor: Color(0xffC26A0A),
                    activeToggleColor: Colors.white,
                    inactiveToggleColor: AppColors.prim,
                    value: deviceConnected,
                    onToggle: (value) {
                      setState(() {
                        deviceConnected = value;
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                height: 68,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffFAFBFF),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.buttonBlueColor.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(4, 8),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Rename",
                            style: TextStyle(
                              color: AppColors.textLightBlueColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Smart Watches",
                            style: TextStyle(
                              color: AppColors.textGreyColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.textGreyColor,
                        size: 12,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                  height: 190,
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffFAFBFF),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.buttonBlueColor.withOpacity(0.2),
                        blurRadius: 10,
                        offset: Offset(4, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: _buildItem("assets/images/svg/status.svg", "Connected", "Status"),
                                  ),
                                  Expanded(
                                    child: _buildItem("assets/images/svg/icon-signal.svg", "Poor", "Signal Strength"),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: _buildItem("assets/images/svg/battery.svg", "32 %", "Battery"),
                                  ),
                                  Expanded(
                                    child: _buildItem("assets/images/svg/share.svg", "32 %", "Share Data"),
                                  )
                                ],
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/images/svg/Vector.svg"),
                          SizedBox(
                            width: 15,
                          ),
                          Text("Privacy and Security")
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Row _buildItem(String imgPath, String title, String subtitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(imgPath),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
             subtitle,
              style: TextStyle(
                color: AppColors.textGreyColor,
              ),
            ),
          ],
        )
      ],
    );
  }
}
