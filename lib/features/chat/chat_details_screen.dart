import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonyx/core/get_it/configurator.dart';
import 'package:neonyx/domain/entity/message_entity.dart';
import 'package:neonyx/features/bottom_sheet_contents/add_photo_content/add_photo_content.dart';
import 'package:neonyx/features/chat/bloc/chat_details_bloc/chat_details_bloc.dart';
import 'package:neonyx/features/chat/bloc/chat_details_bloc/chat_details_event.dart';
import 'package:neonyx/features/chat/bloc/chat_details_bloc/chat_details_state.dart';
import 'package:neonyx/features/chat/chat_menu_screen.dart';
import 'package:neonyx/features/chat/widgets/audio_player_widget.dart';
import 'package:neonyx/features/chat/widgets/send_button_widget.dart';
import 'package:neonyx/features/common/neo_colors.dart';
import 'package:neonyx/features/common/neo_input_field.dart';
import 'package:neonyx/features/common/neo_scaffold.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatDetailsScreen extends StatefulWidget {
  final String icon;
  final String? groupAva;
  final String groupName;
  const ChatDetailsScreen({
    super.key,
    required this.icon,
    required this.groupName,
    required this.groupAva,
  });

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  final controller = TextEditingController();
  ScrollController scrollController = ScrollController();
  final _chatDetailsBloc = getIt<ChatDetailsBloc>()..add(LoadChat());
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String? userName;

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
  void initState() {
    super.initState();
    getUsername();
  }

  getUsername() async {
    final SharedPreferences prefs = await _prefs;
    userName = prefs.getString('username');
    log(userName!);
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  List<AssetEntity> selectedAssetList = [];

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
        resizeToAvoidBottomInset: true,
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
              onPressed: () => Navigator.pop(
                context,
              ),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: NeoColors.soonColor,
              ),
            ),
            title: widget.groupName.isNotEmpty
                ? Column(
                    children: [
                      Text(
                        widget.groupName,
                        style: GoogleFonts.urbanist(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "World wide community",
                        style: GoogleFonts.urbanist(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: NeoColors.primaryColor,
                        ),
                      ),
                    ],
                  )
                : Text(
                    userName!,
                    style: GoogleFonts.urbanist(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChatMenuScreen()));
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 16, top: 12, bottom: 12),
                  child: Stack(
                    // alignment: Alignment.topLeft,
                    children: [
                      widget.groupAva != null
                          ? ClipOval(
                              child: Container(
                                color: NeoColors.grayColor,
                                child: Image.asset(
                                  widget.groupAva!,
                                  width: 32,
                                  height: 32,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            )
                          : const SizedBox(),
                      Positioned(
                        // right: 0.w,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4, left: 4),
                          child: ClipOval(
                            child: Container(
                              color: NeoColors.grayColor,
                              child: Image.asset(
                                widget.icon,
                                width: 32,
                                height: 32,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: BlocProvider.value(
          value: _chatDetailsBloc,
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<ChatDetailsBloc, ChatDetailsState>(
                  builder: (context, state) {
                    if (state is ChatLoaded) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        scrollController.animateTo(
                          scrollController.position.maxScrollExtent,
                          duration: const Duration(
                              milliseconds:
                                  500), // Adjust the duration as needed
                          curve: Curves.easeInOut, // Adjust the curve as needed
                        );
                      });
                      return ListView.separated(
                        controller: scrollController,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, bottom: 90, top: 20),
                        itemCount: state.chat.length,
                        separatorBuilder: (context, index) {
                          return const Divider(
                            height: 1,
                          );
                        },
                        itemBuilder: (context, index) {
                          final message = state.chat[index];
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
                                      message.name ?? userName!,
                                      style: GoogleFonts.urbanist(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: NeoColors.white,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      DateFormat('hh:mm')
                                          .format(message.createdAt!),
                                      style: GoogleFonts.urbanist(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            NeoColors.soonColor.withOpacity(.4),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 4),
                              Flexible(
                                child: message.audioPath != null
                                    ? AudioPlayerWidget(
                                        filepath: message.audioPath!,
                                        isChatPartner: message.isChatMan,
                                      )
                                    : message.assetEntity != null
                                        ? SizedBox(
                                            height: 600,
                                            child: Column(
                                              children: [
                                                GridView.builder(
                                                  physics:
                                                      const BouncingScrollPhysics(),
                                                  itemCount:
                                                      message.assetEntity!.length,
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                  ),
                                                  itemBuilder:
                                                      (context, index) {
                                                    AssetEntity assetEntity =
                                                        message.assetEntity![
                                                            index];
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              2),
                                                      child: AssetEntityImage(
                                                        assetEntity,
                                                        isOriginal: false,
                                                        width: 150,
                                                        height: 150,
                                                        thumbnailSize:
                                                            const ThumbnailSize
                                                                .square(1000),
                                                        fit: BoxFit.cover,
                                                        errorBuilder: (context,
                                                            error, stackTrace) {
                                                          return const Center(
                                                            child: Icon(
                                                              Icons.error,
                                                              color: Colors.red,
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    );
                                                  },
                                                ),
                                                Text(
                                                  "${message.message}",
                                                  style: const TextStyle(
                                                      color: NeoColors.white),
                                                ),
                                              ],
                                            ),
                                          )
                                        : Padding(
                                            padding:
                                                const EdgeInsets.only(top: 6),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 8,
                                                horizontal: 16,
                                              ),
                                              constraints: const BoxConstraints(
                                                  minWidth: 0.0),
                                              decoration: BoxDecoration(
                                                color:
                                                    message.isChatMan == false
                                                        ? NeoColors.black
                                                        : NeoColors.primaryColor
                                                            .withOpacity(.1),
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      const Radius.circular(16),
                                                  topRight:
                                                      const Radius.circular(16),
                                                  bottomLeft: Radius.circular(
                                                    message.isChatMan != false
                                                        ? 4
                                                        : 16,
                                                  ),
                                                  bottomRight: Radius.circular(
                                                    message.isChatMan == false
                                                        ? 4
                                                        : 16,
                                                  ),
                                                ),
                                              ),
                                              child: Text(
                                                message.message ?? '',
                                                textWidthBasis:
                                                    TextWidthBasis.longestLine,
                                                style: GoogleFonts.urbanist(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    color: NeoColors.white),
                                              ),
                                            ),
                                          ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                color: NeoColors.buttonBgColor,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // NeoPopUpRetriever.showBottomSheet(
                        //   context,
                        //   isDismissible: true,
                        //   content: AddPhotoContent(10, RequestType.image, selectedAssetList),
                        // );
                        showModalBottomSheet(
                          context: context,
                          isDismissible: true,
                          isScrollControlled: true,
                          
                          backgroundColor: Colors.transparent,
                          builder: (context) => AddPhotoContent(
                            10,
                            RequestType.image,
                            selectedAssetList,
                          ),
                        );
                      },
                      child: Container(
                        height: 36.h,
                        width: 36.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: NeoColors.soonColor.withOpacity(.4),
                          ),
                          color: Colors.transparent,
                        ),
                        child: const Icon(
                          CupertinoIcons.plus,
                          color: NeoColors.soonColor,
                        ),
                      ),

                      // SvgPicture.asset(
                      //   "assets/svg/chat_plus_icon.svg",
                      //   height: 16,
                      //   width: 16,
                      // ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: NeoInputField(
                        isNeedBorder: true,
                        onEditingComplete: () {
                          if (controller.text.isNotEmpty) {
                            _chatDetailsBloc
                                .add(SendMessage(message: controller.text));
                            controller.clear();
                            setState(() {
                              isTyping = false;
                            });
                          }
                        },
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
                        suffixIcon: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 12.w),
                              child: SvgPicture.asset(
                                "assets/svg/file_icon.svg",
                                height: 16,
                                width: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // const SizedBox(width: 16),
                    // SvgPicture.asset(
                    //   "assets/svg/file_icon.svg",
                    //   height: 16,
                    //   width: 16,
                    // ),
                    const SizedBox(width: 16),
                    SendButton(
                      onStop: (path) {
                        _chatDetailsBloc.add(SendAudio(audioPath: path));
                      },
                      sendMessageTap: () {
                        if (controller.text.isNotEmpty) {
                          _chatDetailsBloc
                              .add(SendMessage(message: controller.text));
                          controller.clear();
                          setState(() {
                            isTyping = false;
                          });
                        }
                      },
                      controller: controller,
                      isSendMessageWithImage: false,
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// floatingActionButton: Column(
//   mainAxisSize: MainAxisSize.min,
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: [
//     //TODO uncomment when will be added other users type messages
//     // isTyping
//     //     ? Padding(
//     //         padding:
//     //             const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//     //         child: Row(
//     //           children: [
//     //             JumpingDots(
//     //               color: NeoColors.soonColor,
//     //               radius: 8,
//     //               animationDuration: const Duration(milliseconds: 300),
//     //               innerPadding: 4,
//     //               verticalOffset: -4,
//     //             ),
//     //             const SizedBox(width: 8),
//     //             Text(
//     //               "user is typing",
//     //               style: GoogleFonts.urbanist(
//     //                 color: NeoColors.soonColor,
//     //                 fontSize: 12,
//     //                 fontWeight: FontWeight.w400,
//     //               ),
//     //             ),
//     //           ],
//     //         ),
//     //       )
//     //     : const SizedBox(),
//     Container(
//       width: double.maxFinite,
//       padding: const EdgeInsets.symmetric(
//         horizontal: 16,
//       ),
//       color: NeoColors.buttonBgColor,
//       child: Row(
//         children: [
//           SvgPicture.asset(
//             "assets/svg/chat_plus_icon.svg",
//             height: 16,
//             width: 16,
//           ),
//           const SizedBox(width: 8),
//           Expanded(
//             child: NeoInputField(
//               onEditingComplete: () {
//                 if (controller.text.isNotEmpty) {
//                   _chatDetailsBloc
//                       .add(SendMessage(message: controller.text));
//                   controller.clear();
//                   setState(() {
//                     isTyping = false;
//                   });
//                 }
//               },
//               type: NeoInputType.text,
//               controller: controller,
//               hint: 'Enter your message',
//               fillColor: NeoColors.buttonBgColor,
//               maxLines: 3,
//               onChanged: (text) {
//                 setState(() {
//                   isTyping = true;
//                 });
//               },
//             ),
//           ),
//           const SizedBox(width: 16),
//           SvgPicture.asset(
//             "assets/svg/file_icon.svg",
//             height: 16,
//             width: 16,
//           ),
//           const SizedBox(width: 16),
//           SendButton(
//             onStop: (path) {
//               _chatDetailsBloc.add(SendAudio(audioPath: path));
//             },
//             sendMessageTap: () {
//               if (controller.text.isNotEmpty) {
//                 _chatDetailsBloc
//                     .add(SendMessage(message: controller.text));
//                 controller.clear();
//                 setState(() {
//                   isTyping = false;
//                 });
//               }
//             },
//             controller: controller,
//           ),
//           const SizedBox(width: 8),
//         ],
//       ),
//     ),
//   ],
// ),
// floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
