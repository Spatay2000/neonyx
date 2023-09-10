import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:neonyx/features/common/neo_colors.dart';
import 'package:neonyx/features/common/neo_scaffold.dart';

class ChatMenuScreen extends StatefulWidget {
  const ChatMenuScreen({super.key});

  @override
  State<ChatMenuScreen> createState() => _ChatMenuScreenState();
}

class _ChatMenuScreenState extends State<ChatMenuScreen> {
  List<String> texts = [
    "Settings",
    "Notifications",
    "417 members",
    "Privacy & security"
  ];
  List<String> icons = [
    "assets/png/settings_icon.png",
    "assets/png/notifications_icon.png",
    "assets/png/members_icon.png",
    "assets/png/privacy_icon.png",
  ];
  List<Moderator> moderators = [
    const Moderator(
        icon: "assets/png/avatar_1_4x_icon.png",
        name: "Asylzhan",
        role: "Administrator"),
    const Moderator(
        icon: "assets/png/avatar_2_4x_icon.png",
        name: "Spatay",
        role: "Administrator"),
    const Moderator(
        icon: "assets/png/avatar_3_4x_icon.png",
        name: "Nurgeldi",
        role: "Administrator"),
  ];
  @override
  Widget build(BuildContext context) {
    return NeoScaffold(
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 16,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: NeoColors.soonColor,
                          ),
                        ),
                      ),
                      Image.asset(
                        "assets/png/group_ava.png",
                        height: 80,
                        width: 80,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: SvgPicture.asset(
                          "assets/svg/search.svg",
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "MemeStream",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: NeoColors.white,
                    ),
                  ),
                  const Text(
                    "You are member",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: NeoColors.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 15),
                  _buildContainer(
                    "This chat created by",
                    "World Wide community",
                    "assets/png/group_ava.png",
                    false,
                    true,
                    const Color(0xFF090F0B),
                  ),
                  const SizedBox(height: 16),
                  _buildContainer(
                    null,
                    "Chat administration",
                    "assets/png/settings_icon.png",
                    true,
                    false,
                    const Color(0xFF040404),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Messages in this room are \nend-to-end encrypted",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 12,
                          height: 1.4,
                          fontWeight: FontWeight.w400,
                          color: NeoColors.primaryColor.withOpacity(.4),
                        ),
                      ),
                      Image.asset(
                        "assets/png/security_icon.png",
                        width: 32,
                        height: 32,
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    height: 294.h,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: NeoColors.black,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: ListView.separated(
                      itemCount: texts.length,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (contex, index) {
                        return Divider(
                            color: NeoColors.soonColor.withOpacity(.1));
                      },
                      itemBuilder: (context, index) {
                        return _buildRow(
                          icons[index],
                          texts[index],
                          texts[index] == texts[2] ? true : false,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 22),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Moderators",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: NeoColors.primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  ListView.separated(
                    itemCount: moderators.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 8);
                    },
                    itemBuilder: (context, index) {
                      return _buildUserContainer(
                        moderators[index].icon!,
                        moderators[index].name!,
                        moderators[index].role!,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildContainer(String? topText, String text, String icon,
      bool isWithGradient, bool isWithArrow, Color color) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.0.r),
        color: color,
        border: isWithGradient
            ? const GradientBoxBorder(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(47, 145, 151, 1),
                    Color.fromRGBO(183, 175, 107, 1),
                  ],
                ),
              )
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topText != null
                  ? Text(
                      topText,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: NeoColors.primaryColor.withOpacity(.4),
                      ),
                    )
                  : const SizedBox(),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: NeoColors.white,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Image.asset(
                icon,
                height: 24,
                width: 24,
              ),
              const SizedBox(width: 12),
              isWithArrow
                  ? const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: NeoColors.primaryColor,
                    )
                  : const SizedBox(),
            ],
          )
        ],
      ),
    );
  }

  _buildRow(String icon, String text, bool isInactive) {
    return Row(
      children: [
        Container(
          height: 44,
          width: 44,
          padding: isInactive ? EdgeInsets.zero : const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: const Color(0xFF090F0B),
              borderRadius: BorderRadius.circular(10)),
          child: Image.asset(
            icon,
            height: isInactive ? 44 : 24,
            width: isInactive ? 44 : 24,
          ),
        ),
        const SizedBox(width: 16),
        Text(
          text,
          style: TextStyle(
            color: isInactive
                ? NeoColors.primaryColor.withOpacity(.2)
                : NeoColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Spacer(),
        Icon(
          Icons.arrow_forward_ios_outlined,
          color: isInactive
              ? NeoColors.primaryColor.withOpacity(.2)
              : NeoColors.primaryColor,
        ),
      ],
    );
  }

  _buildUserContainer(String icon, String name, String role) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipOval(
          child: Container(
            color: NeoColors.grayColor,
            child: Image.asset(
              icon,
              height: 44,
              width: 44,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: NeoColors.primaryColor.withOpacity(.8),
              ),
            ),
            Text(
              role,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: NeoColors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Moderator {
  final String? icon;
  final String? name;
  final String? role;

  const Moderator({
    this.icon,
    this.name,
    this.role,
  });
}
