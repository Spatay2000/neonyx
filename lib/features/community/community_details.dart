import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonyx/features/chat/widgets/chat_list_widget.dart';
import 'package:neonyx/features/common/neo_button.dart';
import 'package:neonyx/features/common/neo_scaffold.dart';
import 'package:neonyx/features/community/community_folder.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../cloud/cloud_files.dart';
import '../common/neo_colors.dart';

class CommunityDetails extends StatefulWidget {
  const CommunityDetails({super.key});

  @override
  State<CommunityDetails> createState() => _CommunityDetailsState();
}

class _CommunityDetailsState extends State<CommunityDetails> {
  List<NavigationDetails> navigationDetails = [
    const NavigationDetails(
        imagePath: 'assets/png/nav_icon.png',
        title: 'News',
        subtitle: 'Articles by categories'),
    const NavigationDetails(
        imagePath: 'assets/png/nav_icon1.png',
        title: 'Meetup reports',
        subtitle: 'Photos, videos & chats'),
    const NavigationDetails(
        imagePath: 'assets/png/nav_icon2.png',
        title: 'Chats',
        subtitle: 'Spread your words')
  ];
  List<Member> members = [
    Member(
        imagePath: 'assets/png/avatar_1_4x_icon.png',
        title: 'Go_dev',
        subtitle: 'GoLang for everyone',
        role: 'Creator'),
    Member(
        imagePath: 'assets/png/avatar_3_4x_icon.png',
        title: 'Go_dev',
        subtitle: 'Web3 meets NFT',
        role: 'Member'),
    Member(
        imagePath: 'assets/png/avatar_4_4x_icon.png',
        title: 'Go_dev',
        subtitle: null,
        role: 'News'),
    Member(
        imagePath: 'assets/png/avatar_1_4x_icon.png',
        title: 'Go_dev',
        subtitle: 'GoLang for everyone',
        role: 'Moderator'),
    Member(
        imagePath: 'assets/png/avatar_1_4x_icon.png',
        title: 'Go_dev',
        subtitle: 'GoLang for everyone',
        role: null),
    Member(
        imagePath: 'assets/png/avatar_1_4x_icon.png',
        title: 'Go_dev',
        subtitle: 'GoLang for everyone',
        role: null),
    Member(
        imagePath: 'assets/png/avatar_1_4x_icon.png',
        title: 'Go_dev',
        subtitle: 'GoLang for everyone',
        role: null),
    Member(
        imagePath: 'assets/png/avatar_1_4x_icon.png',
        title: 'Go_dev',
        subtitle: 'GoLang for everyone',
        role: null),
  ];
  @override
  Widget build(BuildContext context) {
    return NeoScaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              ShaderMask(
                shaderCallback: (rect) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Colors.transparent],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Image.asset(
                  'assets/png/fon2.png',
                  width: 1.sw,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 50.0.h, bottom: 12.h, left: 16.w, right: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BackButton(
                      color: Colors.white,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'World Wide Community',
                          style: GoogleFonts.urbanist(
                              color: Colors.white,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        Image.asset(
                          'assets/png/community.png',
                          width: 60.w,
                          height: 60.h,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.h, horizontal: 12.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: const Color.fromRGBO(47, 145, 151, 0.1)),
                          child: Text(
                            '@wwcomm',
                            style: GoogleFonts.urbanist(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        SvgPicture.asset(
                          'assets/svg/star.svg',
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        SvgPicture.asset('assets/svg/icon_check.svg')
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        for (int i = 0; i < imagesList.length; i++)
                          Container(
                            margin: EdgeInsets.only(left: 10.w),
                            child: Align(
                                widthFactor: 0.5,
                                child: CircleAvatar(
                                  radius: 20.r,
                                  backgroundImage: AssetImage(
                                    imagesList[i],
                                  ),
                                )),
                          ),
                        SizedBox(
                          width: 18.w,
                        ),
                        InkWell(
                          onTap: () => showModalBottomSheet(
                              isScrollControlled: true,
                              useRootNavigator: true,
                              isDismissible: true,
                              backgroundColor: const Color(0xFF090F0B),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                topRight: Radius.circular(24.r),
                                topLeft: Radius.circular(24.r),
                              )),
                              context: context,
                              builder: (context) {
                                return SafeArea(
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        top: 10.h, left: 16.w, right: 16.w),
                                    height: 600.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                        gradient: const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color.fromRGBO(47, 145, 151, 0.2),
                                              Color.fromRGBO(121, 214, 152, 0)
                                            ])),
                                    child: Column(
                                      children: [
                                        Opacity(
                                          opacity: 0.4,
                                          child: Container(
                                            width: 60.w,
                                            height: 4.h,
                                            decoration: BoxDecoration(
                                                color: const Color.fromRGBO(
                                                    124, 167, 170, 1),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        Center(
                                          child: Text(
                                            'Members',
                                            style: GoogleFonts.urbanist(
                                                color: NeoColors.primaryColor,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        Expanded(
                                          child: ListView.separated(
                                              shrinkWrap: false,
                                              itemBuilder:
                                                  (context, index) => Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 12.h,
                                                                horizontal:
                                                                    16.w),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                CircleAvatar(
                                                                  radius: 20.r,
                                                                  backgroundImage:
                                                                      AssetImage(
                                                                    members[index]
                                                                        .imagePath,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    width:
                                                                        16.w),
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      members[index]
                                                                          .title,
                                                                      style: GoogleFonts.urbanist(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize: 16
                                                                              .sp,
                                                                          fontWeight:
                                                                              FontWeight.w400),
                                                                    ),
                                                                    SizedBox(
                                                                      height: members[index].subtitle ==
                                                                              null
                                                                          ? null
                                                                          : 4.h,
                                                                    ),
                                                                    members[index].subtitle ==
                                                                            null
                                                                        ? const SizedBox()
                                                                        : Text(
                                                                            members[index].subtitle!,
                                                                            style: GoogleFonts.urbanist(
                                                                                color: NeoColors.primaryColor,
                                                                                fontSize: 12.sp,
                                                                                fontWeight: FontWeight.w400),
                                                                          )
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            Text(
                                                              members[index]
                                                                      .role ??
                                                                  '',
                                                              style: GoogleFonts.urbanist(
                                                                  color: NeoColors
                                                                      .soonColor,
                                                                  fontSize:
                                                                      12.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                              separatorBuilder:
                                                  (context, index) => Divider(
                                                        color: NeoColors
                                                            .soonColor
                                                            .withOpacity(0.1),
                                                        thickness: 1.0,
                                                      ),
                                              itemCount: members.length),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                          child: Text(
                            '468 members',
                            style: GoogleFonts.urbanist(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          width: 18.w,
                        ),
                        Text(
                          '7,468 followers',
                          style: GoogleFonts.urbanist(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Holding hamster, spinning the crypto wheel\nto cheesy riches',
                  style: GoogleFonts.urbanist(
                      color: NeoColors.primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp),
                ),
                SizedBox(
                  height: 22.h,
                ),
                CustomButton(
                  backgroundStatus: false,
                  title: 'Follow community',
                  onPressed: () => null,
                ),
                SizedBox(
                  height: 22.h,
                ),
                InkWell(
                    onTap: () => pushNewScreen(context,
                        screen: const CommunityFolder(), withNavBar: false),
                    child: ContainerBlack(
                        height: 271.h, navigationDetails: navigationDetails)),
                Text(
                  'All chats & blogs',
                  style: GoogleFonts.urbanist(
                      color: NeoColors.primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp),
                ),
                const ChatListWidget()
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class NavigationDetails {
  final String imagePath;
  final String title;
  final String subtitle;

  const NavigationDetails(
      {required this.imagePath, required this.title, required this.subtitle});
}

class Member {
  final String imagePath;
  final String title;
  final String? subtitle;
  final String? role;

  Member(
      {required this.imagePath,
      required this.title,
      required this.subtitle,
      required this.role});
}

class ContainerBlack extends StatelessWidget {
  final double height;
  final List<NavigationDetails> navigationDetails;
  const ContainerBlack(
      {super.key, required this.navigationDetails, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r),
          color: const Color.fromRGBO(0, 0, 0, 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Navigation',
            style: GoogleFonts.urbanist(
                color: NeoColors.primaryColor,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp),
          ),
          SizedBox(
            height: 12.h,
          ),
          Expanded(
            child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                separatorBuilder: (context, index) => Divider(
                      color: NeoColors.soonColor.withOpacity(0.1),
                      thickness: 1.0,
                    ),
                itemCount: navigationDetails.length,
                itemBuilder: (context, index) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              navigationDetails[index].imagePath,
                              width: 44.w,
                              height: 44.h,
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  navigationDetails[index].title,
                                  style: GoogleFonts.urbanist(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.sp),
                                ),
                                Text(
                                  navigationDetails[index].subtitle,
                                  style: GoogleFonts.urbanist(
                                      color: NeoColors.primaryColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SvgPicture.asset('assets/svg/arrow_right.svg')
                      ],
                    )),
          )
        ],
      ),
    );
  }
}
