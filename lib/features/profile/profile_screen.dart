import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:neonyx/features/common/custom_tab_bar.dart';
import 'package:neonyx/features/common/neo_button.dart';
import 'package:neonyx/features/common/neo_colors.dart';
import 'package:neonyx/features/common/neo_scaffold.dart';
import 'package:neonyx/features/feed/data/models/media_item.dart';
import 'package:neonyx/features/feed/posts_screen.dart';
import 'package:neonyx/features/feed/widget/video_item.dart';

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
                      padding: const EdgeInsets.only(top: 72.0, bottom: 12).r,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // const BackButton(
                          //   color: NeoColors.white,
                          // ),
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
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 12),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 1, color: Color(0x192F9096)),
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
                                      text: '7,468 ',
                                      style: GoogleFonts.urbanist(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'following',
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
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 12),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 1, color: Color(0x192F9096)),
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
                                      text: '13,2K ',
                                      style: GoogleFonts.urbanist(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'followers',
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
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
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
                              SvgPicture.asset('assets/svg/earth.svg'),
                              const SizedBox(width: 4),
                              Text(
                                'bitcoin.org',
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
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
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
                              SvgPicture.asset('assets/svg/face.svg'),
                              const SizedBox(width: 4),
                              Text(
                                '0xD15122E590...34ba',
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
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 24.h,
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(
                              left: 16.0, right: 16, top: 24, bottom: 13)
                          .r,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.0.r),
                            color: const Color(0xFF040404),
                            border: const GradientBoxBorder(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(47, 145, 151, 1),
                                  Color.fromRGBO(183, 175, 107, 1),
                                ],
                              ),
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Follow user',
                                  style: GoogleFonts.urbanist(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: NeoColors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                VerticalDivider(
                                  color: NeoColors.soonColor.withOpacity(.1),
                                  thickness: 2,
                                ),
                                const SizedBox(width: 12),
                                SvgPicture.asset('assets/svg/dots_row.svg'),
                              ],
                            )
                          ],
                        ),
                      ),
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
}

class MediaWidget extends StatelessWidget {
  MediaWidget({
    super.key,
  });
  final List<MediaItem> _itemsPhoto = [
    MediaItem(
        ['assets/png/grid.png', 'assets/png/grid2.png', 'assets/png/grid3.png'],
        "Stephan Seeber"),
    MediaItem([
      'assets/png/grid3.png',
      'assets/png/grid.png',
      'assets/png/grid2.png',
    ], "Stephan Seeber"),
    MediaItem([
      'assets/png/grid2.png',
    ], "Stephan Seeber"),
    MediaItem([
      'assets/png/grid2.png',
      'assets/png/grid.png',
      'assets/png/grid3.png',
      'assets/png/grid2.png',
      'assets/png/grid3.png',
    ], "Stephan Seeber"),
    MediaItem(
        ['assets/png/grid.png', 'assets/png/grid2.png', 'assets/png/grid3.png'],
        "Stephan Seeber"),
  ];
  final List<MediaItem> _items = [
    MediaItem([
      'assets/mp4/insta.mp4',
    ], "Stephan Seeber"),
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        crossAxisCount: 3,
      ),
      itemCount: _items.length + _itemsPhoto.length,
      itemBuilder: (context, index) {
        if (index < _itemsPhoto.length) {
          return InkWell(
            onTap: () {
              _itemsPhoto[index].image.length == 1
                  ? null
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PostsScreen()),
                    );
            },
            child: Stack(
              children: [
                // VideoItem(
                //   videoUrl: _items[index].image.first,
                //   type: false,
                //   auto: true,
                // ),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(_itemsPhoto[index].image.first),
                    ),
                  ),
                ),
                _itemsPhoto[index].image.length == 1
                    ? const SizedBox()
                    : Positioned(
                        left: 110,
                        top: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/svg/more_images.svg'),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              _itemsPhoto[index].image.length.toString(),
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                height: 1.43,
                                letterSpacing: 0.14,
                              ),
                            )
                          ],
                        ))
              ],
            ),
          );
        } else {
          final int videoIndex = index - _itemsPhoto.length;
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PostsScreen()),
              );
            },
            child: Stack(
              children: [
                VideoItem(
                  videoUrl: _items[videoIndex].image.first,
                  type: false,
                  auto: true,
                  value: 0,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

class ArticlesWidget extends StatelessWidget {
  const ArticlesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UserListTIleWidget(),
        Container(
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 0.50, color: Color(0x662F9096)),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16).r,
            child: Column(
              children: [
                Image.asset(
                  'assets/png/media.png',
                  width: 1.sw,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Text(
                        'How the tech magazines shaped the future of web',
                        style: GoogleFonts.urbanist(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SvgPicture.asset('assets/svg/left.svg')
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'Just entered the #Web3 world and now my browser has more tabs open than my patience during software updates. ',
                        style: GoogleFonts.urbanist(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.50,
                        ),
                      ),
                      TextSpan(
                        text: '#WebTabOverflow',
                        style: GoogleFonts.urbanist(
                          color: NeoColors.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.50,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PostWidget extends StatelessWidget {
  const PostWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UserListTIleWidget(),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16),
          child: Column(
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'Just entered the #Web3 world and now my browser has more tabs open than my patience during software updates. ',
                      style: GoogleFonts.urbanist(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.50,
                      ),
                    ),
                    TextSpan(
                      text: '#WebTabOverflow',
                      style: GoogleFonts.urbanist(
                        color: NeoColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.50,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Image.asset(
                'assets/png/media.png',
                width: 1.sw,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/svg/comment_feed.svg'),
                      SizedBox(
                        width: 4.w,
                      ),
                      const Text(
                        '28',
                        style: TextStyle(
                          color: NeoColors.primaryColor,
                          fontSize: 12,
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.30,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/svg/reetWeet.svg'),
                      SizedBox(
                        width: 4.w,
                      ),
                      const Text(
                        '28',
                        style: TextStyle(
                          color: NeoColors.primaryColor,
                          fontSize: 12,
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.30,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/svg/heart.svg'),
                      SizedBox(
                        width: 4.w,
                      ),
                      const Text(
                        '28',
                        style: TextStyle(
                          color: NeoColors.primaryColor,
                          fontSize: 12,
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.30,
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset('assets/svg/share.svg'),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class UserListTIleWidget extends StatelessWidget {
  const UserListTIleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0).r,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/png/capibara.png',
            width: 36.w,
            height: 36.h,
          ),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Opacity(
                  opacity: 0.40,
                  child: Text(
                    '40 minutes ago',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.urbanist(
                      color: NeoColors.primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.40,
                    ),
                  ),
                ),
                Text(
                  'EdNorton',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.urbanist(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    height: 1.40,
                  ),
                ),
              ],
            ),
          ),
          SvgPicture.asset('assets/svg/dots_row.svg'),
        ],
      ),
    );
  }
}
