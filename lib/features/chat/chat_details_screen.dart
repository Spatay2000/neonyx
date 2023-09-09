import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:neonyx/domain/entity/message_entity.dart';
import 'package:neonyx/features/common/neo_colors.dart';
import 'package:neonyx/features/common/neo_input_field.dart';
import 'package:neonyx/features/common/neo_scaffold.dart';

class ChatDetailsScreen extends StatefulWidget {
  const ChatDetailsScreen({super.key});

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  final controller = TextEditingController();

  List<MessageEntity> messages = [
    const MessageEntity(
        name: "Asylzhan",
        icon: "assets/png/avatar_1_4x_icon.png",
        message: "hello",
        isChatMan: true),
    const MessageEntity(
        name: "Spatay",
        icon: "assets/png/avatar_2_4x_icon.png",
        message: "hi",
        isChatMan: false),
    const MessageEntity(
        name: "Nurgeldi",
        icon: "assets/png/avatar_3_4x_icon.png",
        message: "how are you?",
        isChatMan: true),
    const MessageEntity(
        name: "Aliomar",
        icon: "assets/png/avatar_4_4x_icon.png",
        message: "I'm fine and you?",
        isChatMan: false),
    const MessageEntity(
        name: "Arlan",
        icon: "assets/png/avatar_1_4x_icon.png",
        message: "I am good",
        isChatMan: true),
  ];

  bool isTyping = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        setState(() {
          isTyping = false;
        });
      },
      child: NeoScaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(61),
          child: AppBar(
            centerTitle: true,
            elevation: 0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Color.fromRGBO(0, 0, 0, 0.60),
                      Color(0xFF132C27)
                    ]),
              ),
            ),
            leading: IconButton(
              onPressed: () =>
                  Navigator.popUntil(context, (route) => route.isFirst),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: NeoColors.soonColor,
              ),
            ),
            title: const Column(
              children: [
                Text(
                  "MemeStream",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "World wide community",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: NeoColors.primaryColor,
                  ),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Image.asset(
                  "assets/png/group_avatar_1_4x.png",
                  height: 32,
                  width: 32,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isTyping
                ? Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: [
                        JumpingDots(
                          color: NeoColors.soonColor,
                          radius: 8,
                          animationDuration: const Duration(milliseconds: 300),
                          innerPadding: 4,
                          verticalOffset: -4,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "user is typing",
                          style: TextStyle(
                            color: NeoColors.soonColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              color: NeoColors.buttonBgColor,
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/svg/chat_plus_icon.svg",
                    height: 16,
                    width: 16,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: NeoInputField(
                      type: NeoInputType.text,
                      controller: controller,
                      hint: 'Enter your message',
                      fillColor: NeoColors.buttonBgColor,
                      maxLines: 3,
                      onChanged: (text) {
                        setState(() {
                          isTyping = true;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  SvgPicture.asset(
                    "assets/svg/file_icon.svg",
                    height: 16,
                    width: 16,
                  ),
                  const SizedBox(width: 16),
                  Container(
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [
                          Color(0xFFB7AF6B),
                          Color(0xFF2F9197),
                        ]),
                        borderRadius: BorderRadius.circular(12)),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(36, 36),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        if (controller.text.isNotEmpty) {
                          controller.clear();
                        }
                      },
                      child: const Icon(
                        CupertinoIcons.arrow_up,
                        color: NeoColors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: ListView.separated(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
          itemCount: messages.length,
          separatorBuilder: (context, index) {
            return const Divider(
              height: 1,
            );
          },
          itemBuilder: (context, index) {
            final message = messages[index];
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: message.isChatMan == false
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 28,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(28),
                        child: Container(
                          color: NeoColors.grayColor,
                          child: Image.asset(
                            message.icon ??
                                "assets/png/avatar_1_4x_icon.png",
                            width: 28,
                            height: 28,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        message.name ?? "Ed Norton",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: NeoColors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "1:00 am",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: NeoColors.soonColor.withOpacity(.4),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                          constraints: const BoxConstraints(minWidth: 0.0),
                          decoration: BoxDecoration(
                            color: message.isChatMan == false
                                ? NeoColors.black
                                : NeoColors.primaryColor.withOpacity(.1),
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(16),
                              topRight: const Radius.circular(16),
                              bottomLeft: Radius.circular(
                                message.isChatMan != false ? 4 : 16,
                              ),
                              bottomRight: Radius.circular(
                                message.isChatMan == false ? 4 : 16,
                              ),
                            ),
                          ),
                          child: Text(
                            message.message ?? '',
                            textWidthBasis: TextWidthBasis.longestLine,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: NeoColors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
