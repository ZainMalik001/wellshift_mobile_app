import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:well_shift_app/core/common/app_colors.dart';
import 'package:well_shift_app/core/common/app_constants.dart';

class DashboardPage extends StatefulWidget {
  final int pageNo;
  const DashboardPage({Key? key , this.pageNo = 0}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedPage = 0;
  
  @override
  void initState() {
    super.initState();
    selectedPage = widget.pageNo;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      bottomNavigationBar: BottomNavBar(
        selectedPage: selectedPage,
        onPressed: (index) {
          setState(() {
            selectedPage = index;
          });
        },
      ),
      body: pages[selectedPage]
    );
  }
}

class BottomNavBar extends StatelessWidget {
  final Function(int) onPressed;
  final int selectedPage;
  const BottomNavBar({
    Key? key,
    required this.selectedPage,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildWidget(0, "progress.svg", "Progress"),
                _buildWidget(1, "journey.svg", "Journey"),
                _buildWidget(2, "recommend.svg", "Recommend"),
                _buildWidget(3, "support.svg", "Support"),
                _buildWidget(4, "profile.svg", "Profile"),
              ],
            ),
          ),
        ),
        Container(
          color: Colors.white,
          height: MediaQuery.of(context).padding.bottom,
        )
      ],
    );
  }

  Widget _buildWidget(int index, String imgName, String title) {
    return GestureDetector(
      onTap: () => onPressed.call(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            'assets/images/svg/$imgName',
            color: index == selectedPage
                ? Color(0xffEE978C)
                : AppColors.textLightBlueColor,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              height: 2.5833333333333335,
              color: index == selectedPage
                  ? Color(0xffEE978C)
                  : AppColors.textLightBlueColor,
            ),
          ),
        ],
      ),
    );
  }
}
