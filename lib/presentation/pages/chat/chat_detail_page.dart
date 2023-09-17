import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:well_shift_app/core/common/app_colors.dart';
import 'package:well_shift_app/presentation/common_widgets/custom_back_button.dart';

class ChatDetail extends StatelessWidget {
  final String? image;
  final String? name;
  const ChatDetail({Key? key, this.image, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ChatContentModel> chatContent = [
      ChatContentModel(chat: "Hello Alisa", isSelf: true),
      ChatContentModel(chat: "Hello Abeer", isSelf: false),
      ChatContentModel(chat: "I’m happy to get from you!", isSelf: false),
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomBackButton(
                title: "Recommendation",
                icon2: Icon(
                  Icons.search,
                  color: Color(0xffFE9F93),
                ),
                icon2OnPressed: () {},
                icon: Icon(
                  Icons.info,
                  color: Color(0xffFE9F93),
                ),
                iconOnPressed: () {},
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: FlutterLogo(size: 32),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    name ?? "NA",
                    style: TextStyle(
                      color: Color(0xff0364ad),
                      fontSize: 18,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffBBDFFA),
                      image: DecorationImage(
                        image: AssetImage("assets/images/png/chat_bg.png"),
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: chatContent.length,
                      itemBuilder: (context, index) => Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: chatContent[index].isSelf
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                            chatContent[index].isSelf ?  SizedBox():Container(
                                width: 32,
                                height: 32,
                                margin: const EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                  padding: const EdgeInsets.all(8),
                                  margin: const EdgeInsets.only(bottom: 16),
                                  decoration: BoxDecoration(
                                      color: chatContent[index].isSelf
                                          ? AppColors.buttonBlueColor
                                          : AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Text(
                                    chatContent[index].chat,
                                    style: TextStyle(
                                      color: chatContent[index].isSelf
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  // height: 50,
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 10, bottom: 20),
                  child: Row(children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: TextField(
                            decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff242424)),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          hintText: "Type a message",
                          hintStyle: TextStyle(
                            color: Color(0xffC4C4C4),
                            fontSize: 16,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                          ),
                          suffixIcon: Icon(
                            Icons.attach_file,
                            color: Color(0xff707070),
                          ),
                          prefixIcon: Icon(
                            Icons.emoji_emotions,
                            color: Color(0xff707070),
                          ),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color(0xfff2f4f8),
                          width: 1,
                        ),
                        color: Color(0xff242424).withOpacity(0.05),
                      ),
                      child: Icon(Icons.mic, color: AppColors.buttonBlueColor),
                    )
                  ]),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class ChatContentModel {
  String chat;
  bool isSelf;
  ChatContentModel({required this.chat, required this.isSelf});
}
