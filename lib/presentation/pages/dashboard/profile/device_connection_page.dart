import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:well_shift_app/core/common/app_colors.dart';
import 'package:well_shift_app/presentation/common_widgets/custom_back_button.dart';
import 'package:well_shift_app/presentation/pages/journey_personalization/device_info_page.dart';

class DeviceConnectionPage extends StatefulWidget {
  const DeviceConnectionPage({Key? key}) : super(key: key);

  @override
  State<DeviceConnectionPage> createState() => _DeviceConnectionPageState();
}

class _DeviceConnectionPageState extends State<DeviceConnectionPage> {
  bool deviceConnected = false;
  int selectedDevice = 0;
  List wearables = [
    {
      'svgPath': 'assets/images/svg/device_connection.svg',
      'deviceName': 'Apple Watch',
    },
    {
      'svgPath': 'assets/images/svg/device_connection.svg',
      'deviceName': 'Smart Watch',
    },
    {
      'svgPath': 'assets/images/svg/alexa.svg',
      'deviceName': 'Alexa',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              CustomBackButton(title: "Profile"),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Device Connection",
                    style: TextStyle(
                      color: Color(0xff0364ad),
                      fontSize: 21,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
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
                    value: true,
                    onToggle: (value) {
                      // setState(() {
                      //   deviceConnected = value;
                      // });
                    },
                  )
                ],
              ),
              SizedBox(
                height: 32,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return _wearablesWidget(
                    index,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  /// This is wearables widget
  /// This widget is used to show the wearables
  /// multiple wearables are linked with the app and only one wearable is connected at a time
  /// for which this widget is used
  _wearablesWidget(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedDevice = index;
        });
      },
      child: Container(
        height: 70,
        margin: index == 0 ? EdgeInsets.zero : EdgeInsets.only(top: 12),
        padding:
            const EdgeInsets.only(left: 16.0, top: 12, bottom: 12, right: 15),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.whiteColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  wearables[index]['svgPath'],
                  color: Color(0xff707070),
                  width: 32,
                  height: 32,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      wearables[index]['deviceName'],
                      style: TextStyle(
                        color: Color(0xff242424),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      index == selectedDevice ? "Connected" : "New",
                      style: TextStyle(
                        color: index == selectedDevice
                            ? Color(0xff028fc5)
                            : Color(0xff707070).withOpacity(0.7),
                        fontSize: 13,
                      ),
                    )
                  ],
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeviceInfoPage(deviceConnected: true),
                  ),
                );
              },
              child: SvgPicture.asset(
                "assets/images/svg/i_icon.svg",
                color: index == selectedDevice ? null : Color(0xff707070),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
