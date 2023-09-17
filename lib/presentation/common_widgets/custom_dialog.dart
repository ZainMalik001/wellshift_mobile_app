import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:well_shift_app/core/common/app_colors.dart';



/// This method is used to call a common dialog in the app
/// This common dialog is used in the app where we need to show a dialog
Future<void> showCommonDialog(
  context, {
  required String title,
  required String description,
  String? buttonText1,
  required String buttonText2,
  required String svgPath,
  Function()? onTapButton1,
  Function()? onTapButton2,
}) {
  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    context: context,
    pageBuilder: (_, __, ___) {
      return CommonDialog(
        title: title,
        description: description,
        svgPath: svgPath,
        buttonText1: buttonText1,
        buttonText2: buttonText2,
        onTapButton1: onTapButton1,
        onTapButton2: onTapButton2,
      );
    },
  );
}

class CommonDialog extends StatefulWidget {
  final String title, description;
  final String svgPath;
  final String? buttonText1;
  final String buttonText2;
  final Function? onTapButton1;
  final Function? onTapButton2;
  const CommonDialog({
    Key? key,
    required this.title,
    required this.description,
    required this.svgPath,
    this.buttonText1 = "Not Now",
    required this.buttonText2,
    required this.onTapButton1,
    required this.onTapButton2,
  }) : super(key: key);

  @override
  State<CommonDialog> createState() => _CommonDialogState();
}

class _CommonDialogState extends State<CommonDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  Future<void> closeDialog() {
    return _controller.reverse().then((value) => Navigator.pop(context));
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(
        milliseconds: 500,
      ),
      vsync: this,
    );

    _animation = CurveTween(curve: Curves.easeIn).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          height: 345,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(children: [
              DefaultTextStyle(
                style: TextStyle(color: Colors.black),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        widget.svgPath,
                        width: 88,
                        height: 88,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.buttonBlueColor),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.description,
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff0364AD).withOpacity(0.7)
                              // fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 44,
                            child: TextButton(
                              onPressed: () async {
                                await closeDialog().then((value) {
                                  widget.onTapButton1?.call();
                                });

                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (context) => HimiLovePlans()));
                              },
                              style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all(
                                    Color(0xff0364AD).withOpacity(0.7)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                              ),
                              child: Text(widget.buttonText1 ?? "Not Now"),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 44,
                            child: ElevatedButton(
                              onPressed: () async {
                                await closeDialog().then((value) {
                                  widget.onTapButton2?.call();
                                });

                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (context) => HimiLovePlans()));
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xff028FC5)),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                              ),
                              child: AutoSizeText(
                                widget.buttonText2,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
