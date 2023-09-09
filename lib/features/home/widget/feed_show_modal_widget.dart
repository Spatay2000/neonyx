import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:neonyx/features/common/neo_button.dart';
import 'package:neonyx/features/common/neo_colors.dart';
import 'package:neonyx/features/common/neo_scaffold.dart';

class FeedShowModalWidget extends StatefulWidget {
  const FeedShowModalWidget({
    super.key,
  });

  @override
  State<FeedShowModalWidget> createState() => _FeedShowModalWidgetState();
}

class _FeedShowModalWidgetState extends State<FeedShowModalWidget> {
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
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: data.length,
      child: NeoScaffold(
        body: Column(
          children: [
            Stack(
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
                    'assets/png/fon.png',
                    width: 1.sw,
                    fit: BoxFit.cover,
                    // opacity: AnimationController(value: 0.5),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 72.0, horizontal: 15),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: SvgPicture.asset('assets/svg/back_button.svg'),
                        ),
                      ),
                    ),
                    // CircleAvatar(
                    //   radius: 88,
                    //   backgroundColor: Color(0xFFB6AF6B),
                    //   child: CircleAvatar(
                    //     radius: 70,
                    //     backgroundColor: Colors.transparent,
                    //     child: Image.asset(
                    //       'assets/png/avatar_2_4x_icon.png',
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
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
                          // shape: OvalBorder(
                          //     side: GradientBoxBorder(gradient: gradient)
                          //     // side: BorderSide(
                          //     //   width: 3,
                          //     //   strokeAlign: BorderSide.strokeAlignOutside,
                          //     //   color: Color(0xFFB6AF6B),
                          //     // ),
                          //     ),
                          image: const DecorationImage(
                              image: AssetImage(
                                'assets/png/capibara.png',
                              ),
                              fit: BoxFit.contain)),
                    ),
                    SizedBox(
                      height: 23.h,
                    ),
                    Text(
                      'SatoshiSeeker',
                      style: GoogleFonts.urbanist(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 28.0, right: 28).r,
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
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          backgroundStatus: true,
                          width: 91.w,
                          height: 40.h,
                          title: 'Follow',
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.h, horizontal: 12.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: const Color.fromRGBO(47, 145, 151, 0.1)),
                          child: Text(
                            '@satoshiseeker',
                            style: GoogleFonts.urbanist(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: NeoColors.primaryColor),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: 1.sw,
                        height: 1.h,
                        color: NeoColors.primaryColor,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TabBar(
                            padding: const EdgeInsets.all(10),
                            isScrollable: true,
                            onTap: (int index) {},
                            controller: _tabController,
                            indicatorColor: Colors.transparent,
                            indicator: const UnderlineTabIndicator(
                                borderSide: BorderSide.none),
                            labelPadding: EdgeInsets.zero,
                            tabs: [
                              for (int i = 0; i < data.length; i++)
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: ShapeDecoration(
                                      color: const Color(0x192F9096),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: Text(
                                      data[i],
                                      style: GoogleFonts.urbanist(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        height: 1.40,
                                      ),
                                    ),
                                  ),
                                )
                            ]),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const PostWidget();
                    },
                  ),
                  Container(),
                  Container(),
                  Container(),
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
            'assets/png/avatar_3_4x_icon.png',
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
