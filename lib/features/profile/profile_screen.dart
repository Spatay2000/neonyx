import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:neonyx/features/common/custom_tab_bar.dart';
import 'package:neonyx/features/common/neo_button.dart';
import 'package:neonyx/features/common/neo_colors.dart';
import 'package:neonyx/features/common/neo_scaffold.dart';
import 'package:neonyx/features/feed/widget/articles_widget.dart';
import 'package:neonyx/features/feed/widget/media_widget.dart';
import 'package:neonyx/features/feed/widget/post_widget.dart';
import 'package:neonyx/features/profile/profile_settings.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../domain/entity/feed_entity.dart';
import '../feed/widget/feed_strory.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;
  List<String> data = [
    'All posts',
    'Posts',
    'Media',
    'Articles',
    'Reposts',
    'Articles',
    'Reposts',
  ];

  List<FeedEntity> feedList = [
    FeedEntity(
        id: 1,
        avatar: "assets/png/Avatar_group.png",
        groupAva: 'assets/png/group_ava.png',
        username: 'MemeStream',
        storyImage: 'assets/png/story.png',
        postTime: 8,
        commentTotal: 10,
        likeTotal: 15,
        shareTotal: 12),
    FeedEntity(
        id: 2,
        avatar: "assets/png/avatar_2_4x_icon.png",
        storyImage: 'assets/png/story.png',
        username: 'Team General Chat',
        postTime: 8,
        commentTotal: 10,
        likeTotal: 15,
        shareTotal: 12),
    FeedEntity(
        id: 3,
        avatar: "assets/png/avatar_3_4x_icon.png",
        username: 'Go dev',
        postTime: 8,
        commentTotal: 10,
        likeTotal: 15,
        shareTotal: 12),
    FeedEntity(
        id: 4,
        avatar: "assets/png/avatar_4_4x_icon.png",
        username: 'MemeStream',
        postTime: 8,
        commentTotal: 10,
        likeTotal: 15,
        shareTotal: 12),
    FeedEntity(
        id: 5,
        avatar: "assets/png/avatar_1_4x_icon.png",
        username: 'Team General Chat',
        postTime: 8,
        commentTotal: 10,
        likeTotal: 15,
        shareTotal: 12),
    FeedEntity(
        id: 6,
        avatar: "assets/png/avatar_2_4x_icon.png",
        username: 'Go dev',
        postTime: 8,
        commentTotal: 10,
        likeTotal: 15,
        shareTotal: 12),
    FeedEntity(
        id: 7,
        avatar: "assets/png/avatar_3_4x_icon.png",
        username: 'Team General Chat',
        postTime: 8,
        commentTotal: 10,
        likeTotal: 15,
        shareTotal: 12),
    FeedEntity(
        id: 8,
        avatar: "assets/png/avatar_4_4x_icon.png",
        username: 'Go dev',
        postTime: 8,
        commentTotal: 10,
        likeTotal: 15,
        shareTotal: 12),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _tabController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: data.length,
      child: NeoScaffold(
        body: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                ShaderMask(
                  shaderCallback: (rect) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black, Colors.transparent],
                    ).createShader(
                        Rect.fromLTRB(0, 0, rect.width, rect.height));
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset(
                    'assets/png/fon2.png',
                    width: 1.sw,
                    fit: BoxFit.cover,
                    // opacity: AnimationController(value: 0.5),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                              top: 70.0, bottom: 12, right: 17)
                          .r,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // const BackButton(
                          //   color: NeoColors.white,
                          // ),
                          const Spacer(
                            flex: 3,
                          ),
                          Container(
                            width: 88.w,
                            height: 88.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(180.0.r),
                              border: const GradientBoxBorder(
                                  width: 5,
                                  gradient: LinearGradient(colors: [
                                    Color.fromRGBO(47, 145, 151, 1),
                                    Color.fromRGBO(183, 175, 107, 1),
                                  ])),
                            ),
                            child: Image.asset(
                              'assets/png/capibara.png',
                            ),
                          ),
                          const Spacer(
                            flex: 2,
                          ),
                          SvgPicture.asset('assets/svg/add.svg'),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     InkWell(
                          //       onTap: () {
                          //         Navigator.pop(context);
                          //       },
                          //       child: Align(
                          //         alignment: Alignment.topRight,
                          //         child:
                          //             SvgPicture.asset('assets/svg/share2.svg'),
                          //       ),
                          //     ),
                          //     SizedBox(
                          //       width: 26.r,
                          //     ),
                          //     InkWell(
                          //       onTap: () {
                          //         Navigator.pop(context);
                          //       },
                          //       child: Align(
                          //         alignment: Alignment.topRight,
                          //         child:
                          //             SvgPicture.asset('assets/svg/create.svg'),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'SatoshiSeeker',
                          style: GoogleFonts.urbanist(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Image.asset('assets/png/done.png')
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 28.0, right: 28, top: 12)
                              .r,
                      child: Opacity(
                        opacity: 0.80,
                        child: Text(
                          'Holding hamster, spinning the crypto wheel to cheesy riches',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.urbanist(
                            color: NeoColors.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.40,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        followContainers('7,468 ', 'following'),
                        SizedBox(
                          width: 8.w,
                        ),
                        followContainers('13,2K ', 'followers'),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        transparentContainer(
                            'bitcoin.org', 'assets/svg/earth.svg'),
                        SizedBox(
                          width: 8.w,
                        ),
                        transparentContainer(
                            '0xD15122E590...34ba', 'assets/svg/face.svg'),
                      ],
                    ),
                    // SizedBox(
                    //   height: 24.h,
                    // ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 23.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: CustomButton(
                              notGradient: true,
                              height: 42.h,
                              backgroundStatus: true,
                              onPressed: () => pushNewScreen(context,
                                  screen: const ProfileSettings(),
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                  withNavBar: false),
                              title: 'Profile settings',
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Expanded(
                            child: CustomButton(
                              notGradient: true,
                              height: 42.h,
                              backgroundStatus: true,
                              onPressed: () => null,
                              title: 'Share profile',
                            ),
                          )
                        ],
                      ),
                    ),
                    FeedStoryWidget(
                      profile: false,
                      feedStory: feedList,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomTabBar(
                      tabs: data,
                      controller: _tabController,
                      type: false,
                      padding: EdgeInsets.only(
                        left: 16.0.w,
                        right: 16.w,
                      ),
                      secondText: false,
                    ),
                  ],
                ),
                Positioned(
                  top: 148.r,
                  // left: 144.r,
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 4, left: 4, right: 6, bottom: 4),
                    decoration: ShapeDecoration(
                      color: const Color(0x192F9096),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/svg/email.svg'),
                        SizedBox(
                          width: 2.r,
                        ),
                        Text(
                          'satoshiseeker',
                          style: GoogleFonts.urbanist(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: -0.30,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: const BouncingScrollPhysics(),
                controller: _tabController,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 15,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return const PostWidget();
                    },
                  ),
                  ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    children: const [
                      PostWidget(),
                    ],
                  ),
                  MediaWidget(),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return const ArticlesWidget();
                    },
                  ),
                  Container(),
                  Container(),
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container followContainers(
    String text1,
    String text2,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0x192F9096)),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: text1,
                  style: GoogleFonts.urbanist(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                TextSpan(
                  text: text2,
                  style: GoogleFonts.urbanist(
                    color: NeoColors.primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container transparentContainer(String text, String svg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: ShapeDecoration(
        color: const Color(0x192F9096),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(svg),
          const SizedBox(width: 4),
          Text(
            text,
            style: GoogleFonts.urbanist(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 0,
              letterSpacing: -0.30,
            ),
          ),
        ],
      ),
    );
  }
}
