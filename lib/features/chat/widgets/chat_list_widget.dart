import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonyx/domain/entity/chat_entity.dart';
import 'package:neonyx/domain/entity/message_entity.dart';
import 'package:neonyx/features/chat/chat_details_screen.dart';
import 'package:neonyx/features/common/neo_colors.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../core/get_it/configurator.dart';
import '../bloc/chat_details_bloc/chat_details_bloc.dart';
import '../bloc/chat_details_bloc/chat_details_event.dart';
import '../bloc/chat_details_bloc/chat_details_state.dart';

class ChatListWidget extends StatefulWidget {
  const ChatListWidget({super.key});

  @override
  State<ChatListWidget> createState() => _ChatListWidgetState();
}

class _ChatListWidgetState extends State<ChatListWidget> {
  final _chatDetailsBloc = getIt<ChatDetailsBloc>()..add(LoadChat());
  MessageEntity? lastMessage;
  @override
  void initState() {
    super.initState();
  }

  List<ChatEntity> chats = [
    const ChatEntity(
        id: 1,
        isGroupChat: true,
        avatar: "assets/png/Avatar_group.png",
        groupAva: 'assets/png/group_ava.png',
        groupName: "MemeStream",
        userName: "EdNorton",
        lastMessage: "Yeah! But I think you’ll need a pretty advanc",
        lastMessageTime: "2 min ago",
        isPinned: true),
    const ChatEntity(
        id: 2,
        isGroupChat: true,
        avatar: "assets/png/Avatar_group.png",
        groupAva: 'assets/png/group_ava.png',
        groupName: "Team General Chat",
        userName: "Coacheller",
        lastMessage: "Yeah! But I think you’ll need a pretty advanced wallet",
        lastMessageTime: "2 min ago",
        isPinned: true),
    const ChatEntity(
        id: 3,
        isGroupChat: false,
        avatar: "assets/png/avatar_1_4x_icon.png",
        groupName: "",
        userName: "Go dev",
        lastMessage: "Yeah! But I think you’ll need a pretty advanced wallet",
        lastMessageTime: "2 min ago",
        isPinned: false),
    const ChatEntity(
        id: 4,
        isGroupChat: false,
        avatar: "assets/png/avatar_2_4x_icon.png",
        groupName: "",
        userName: "Asylzhan",
        lastMessage: "Yeah! But I think you’ll need a pretty advanced wallet",
        lastMessageTime: "2 min ago",
        isPinned: false),
    const ChatEntity(
        id: 5,
        isGroupChat: true,
        avatar: "assets/png/group_avatar_3_4x.png",
        groupName: "GS Go Esports chat",
        userName: "Saraha",
        lastMessage: "Yeah! But I think you’ll need a pretty advanced wallet",
        lastMessageTime: "2 min ago",
        isPinned: true),
    const ChatEntity(
        id: 6,
        isGroupChat: false,
        avatar: "assets/png/avatar_3_4x_icon.png",
        groupName: "",
        userName: "Spatay",
        lastMessage: "Yeah! But I think you’ll need a pretty advanced wallet",
        lastMessageTime: "2 min ago",
        isPinned: false),
    const ChatEntity(
        id: 7,
        isGroupChat: false,
        avatar: "assets/png/avatar_4_4x_icon.png",
        groupName: "",
        userName: "Nurgeldi",
        lastMessage: "Yeah! But I think you’ll need a pretty advanced wallet",
        lastMessageTime: "2 min ago",
        isPinned: false),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: _chatDetailsBloc,
        child: BlocBuilder<ChatDetailsBloc, ChatDetailsState>(
          builder: (context, state) {
            if (state is ChatLoaded) {
              return SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: chats.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      if (state.chat.isNotEmpty) {
                        lastMessage = state.chat.last;
                      }
                      return _buildChats(
                          chats[index].isGroupChat!,
                          chats[index].avatar!,
                          chats[index].groupAva,
                          chats[index].groupName!,
                          chats[index].userName!,

                          // ignore: unnecessary_null_comparison
                          lastMessage != null
                              ? lastMessage!.audioPath != null
                                  ? 'Голосовое сообщение'
                                  : lastMessage!.message ?? ' '
                              : chats[index].lastMessage ?? " ",
                          // chats[index].lastMessage!,
                          chats[index].lastMessageTime!,
                          chats[index].isPinned!, onTap: () {
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: ChatDetailsScreen(
                            icon: chats[index].avatar!,
                            groupName: chats[index].groupName!,
                            groupAva: chats[index].groupAva,
                          ),
                          withNavBar: false, // OPTIONAL VALUE. True by default.
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        ).then((value) => _chatDetailsBloc.add(LoadChat()));
                      });
                    },
                    separatorBuilder: ((context, index) {
                      return Divider(
                        color: NeoColors.soonColor.withOpacity(0.1),
                        thickness: 1.0,
                      );
                    }),
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }

  _buildChats(
      bool isGroupChat,
      String avatar,
      String? groupAva,
      String groupName,
      String userName,
      String? lastMessage,
      String lastMessageTime,
      bool isPinned,
      {Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Slidable(
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            _buildSlidableWidget("assets/svg/unread_icon.svg", "Unread", false),
            _buildSlidableWidget("assets/svg/pin_icon.svg", "Pin", false),
          ],
        ),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            _buildSlidableWidget("assets/svg/mute_icon.svg", "Mute", false),
            _buildSlidableWidget("assets/svg/delete_icon.svg", "Delete", true),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              Stack(
                // alignment: Alignment.topLeft,
                children: [
                  groupAva != null
                      ? ClipOval(
                          child: Container(
                            color: NeoColors.grayColor,
                            child: Image.asset(
                              groupAva,
                              width: 20,
                              height: 20,
                              fit: BoxFit.contain,
                            ),
                          ),
                        )
                      : const SizedBox(),
                  Positioned(
                    // right: 0.w,
                    child: Padding(
                      padding: EdgeInsets.only(top: 4, left: 4),
                      child: ClipOval(
                        child: Container(
                          color: NeoColors.grayColor,
                          child: Image.asset(
                            avatar,
                            width: groupAva == null ? 44 : 40,
                            height: groupAva == null ? 44 : 40,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          isGroupChat ? groupName : userName,
                          style: GoogleFonts.urbanist(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: NeoColors.primaryColor,
                          ),
                        ),
                        isPinned
                            ? SvgPicture.asset(
                                "assets/svg/pinned_icon.svg",
                                height: 15,
                                width: 15,
                              )
                            : const SizedBox(),
                        const SizedBox(width: 4),
                        const Spacer(),
                        !isGroupChat
                            ? Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/svg/read_msg_icon.svg",
                                  ),
                                  const SizedBox(width: 4),
                                ],
                              )
                            : const SizedBox(),
                        Text(
                          lastMessageTime,
                          style: GoogleFonts.urbanist(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: NeoColors.primaryColor,
                          ),
                        ),
                        isGroupChat
                            ? Container(
                                padding: const EdgeInsets.all(4),
                                margin: const EdgeInsets.only(left: 4),
                                decoration: const BoxDecoration(
                                  color: NeoColors.primaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  "1",
                                  style: GoogleFonts.urbanist(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: NeoColors.white,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                    isGroupChat
                        ? Text(
                            userName,
                            style: GoogleFonts.urbanist(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: NeoColors.white,
                            ),
                          )
                        : const SizedBox(),
                    Text(
                      lastMessage!,
                      style: GoogleFonts.urbanist(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: NeoColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  CustomSlidableAction _buildSlidableWidget(
      String icon, String text, bool isDeleteButton) {
    return CustomSlidableAction(
      onPressed: (context) {},
      foregroundColor:
          isDeleteButton ? NeoColors.darkRed : NeoColors.primaryColor,
      backgroundColor: NeoColors.primaryColor.withOpacity(0),
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Container(
        padding: const EdgeInsets.all(1),
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          // color: const Color(0xFF0f2221),
          borderRadius: BorderRadius.circular(6),
          gradient: isDeleteButton
              ? const LinearGradient(
                  colors: [
                    Color.fromRGBO(193, 21, 52, 0.20),
                    Color.fromRGBO(193, 21, 52, 0.10),
                  ],
                )
              : const LinearGradient(
                  colors: [
                    Color.fromRGBO(47, 145, 151, 0.20),
                    Color.fromRGBO(47, 145, 151, 0.10),
                  ],
                ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              height: 26,
              width: 26,
            ),
            const SizedBox(height: 2),
            Text(
              text,
              style: GoogleFonts.urbanist(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
