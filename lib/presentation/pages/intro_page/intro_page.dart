import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:well_shift_app/core/common/app_colors.dart';
import 'package:well_shift_app/core/common/app_localization.dart';
import 'package:well_shift_app/core/common/resources.dart';
import 'package:well_shift_app/presentation/pages/login/login_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int _currImage = 0;
  CarouselController _carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: CarouselSlider(
              carouselController: _carouselController,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height,

                aspectRatio: 9 / 16,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: false,
                reverse: false,
                pageSnapping: false,
                autoPlay: false,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollPhysics: NeverScrollableScrollPhysics(),
                enlargeCenterPage: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currImage = index;
                  });
                },
                scrollDirection: Axis.horizontal,
              ),
              items: introImageList
                  .map((e) => Image.asset(
                        e["img"].toString(),
                        fit: BoxFit.cover,
                      ))
                  .toList(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: CustomPaint(
                      foregroundPainter: FadingEffect(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            introImageList[_currImage]["title"].toString(),
                            style: TextStyle(
                                color: Color(0xff0364AD),
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            introImageList[_currImage]["text"].toString(),
                            style: TextStyle(
                              color: Color(0xff0364AD),
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: introImageList.map((e) {
                              int index = introImageList.indexOf(e);
                              return Container(
                                width: index == _currImage ? 24 : 8,
                                height: 8.0,
                                margin: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 2.0),
                                decoration: BoxDecoration(
                                    shape: index == _currImage
                                        ? BoxShape.rectangle
                                        : BoxShape.circle,
                                    color: _currImage == index
                                        ? Color(0xffDF892C)
                                        : Color(0xffDF892C).withOpacity(0.3),
                                    borderRadius: index == _currImage
                                        ? BorderRadius.circular(8)
                                        : null),
                              );
                            }).toList(),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              _currImage != 0
                                  ? SizedBox(
                                      width: _currImage == 0
                                          ? MediaQuery.of(context).size.width -
                                              40
                                          : (MediaQuery.of(context).size.width -
                                                  60) /
                                              2,
                                      child: TextButton(
                                        style: ButtonStyle(
                                            // backgroundColor: MaterialStateProperty.all(AppColors.buttonBlueColor)

                                            ),
                                        onPressed: () {
                                          _carouselController.previousPage(
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.ease);
                                          // setState(() {
                                          //   _currImage -= 1;
                                          // });
                                        },
                                        child: Text(
                                          "Back",
                                          style: TextStyle(
                                            color: Color(0xff0364AD),
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    )
                                  : SizedBox(),
                              _currImage != 0
                                  ? SizedBox(width: 20)
                                  : SizedBox(),
                              SizedBox(
                                width: _currImage == 0
                                    ? MediaQuery.of(context).size.width - 40
                                    : (MediaQuery.of(context).size.width - 60) /
                                        2,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              AppColors.buttonBlueColor)),
                                  onPressed: () {
                                    _carouselController.nextPage(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.ease);
                                    _currImage == 3
                                        ? Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage()))
                                        : null;
                                  },
                                  child: Text(
                                    _currImage == 3 ?  "Start" : AppLocalizations.of(context).translate("Next"),
                                    style: TextStyle(
                                      // color: Color(0xff0364AD),
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FadingEffect extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height));
    LinearGradient lg = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [
          0.0,
          0.3,
          0.5,
          1.0
        ],
        colors: [
          //create 2 white colors, one transparent
          Color.fromARGB(1, 192, 222, 248),
          Color.fromARGB(240, 192, 222, 248),
          Color.fromARGB(240, 192, 222, 248),
          Color.fromARGB(240, 192, 222, 248)
        ]);
    Paint paint = Paint()..shader = lg.createShader(rect);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(FadingEffect linePainter) => false;
}
