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
import 'package:neonyx/features/feed/widget/articles_widget.dart';
import 'package:neonyx/features/feed/widget/media_widget.dart';
import 'package:neonyx/features/feed/widget/post_widget.dart';
import 'package:neonyx/features/feed/widget/video_item.dart';

class FeedShowModalWidget extends StatefulWidget {
  const FeedShowModalWidget({
    super.key,
  });

  @override
  State<FeedShowModalWidget> createState() => _FeedShowModalWidgetState();
}

class _FeedShowModalWidgetState extends State<FeedShowModalWidget>
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

  late ScrollController _scrollController;
  bool lastStatus = true;
  double height = 520.h;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
    _tabController = TabController(length: data.length, vsync: this);
  }

  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _toggleAppBarExpansion() {
    // Calculate the target offset based on whether you want to open or close
    final double targetOffset =
        lastStatus ? 200.0 : 500.0; // Adjust the values as needed
    _scrollController.animateTo(
      targetOffset,
      duration: Duration(milliseconds: 500), // Adjust the duration as needed
      curve: Curves.easeInOut, // Adjust the curve as needed
    );
  }

  bool get _isShrink {
    return _scrollController.hasClients &&
        _scrollController.offset > (height - kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: data.length,
      child: NeoScaffold(
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              leading: null,
              pinned: true,
              expandedHeight: height,
              collapsedHeight: 200.h,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,
                title: _isShrink
                    ? Stack(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/png/bg.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 40.h,
                              ),
                              ListTile(
                                leading: Image.asset(
                                  'assets/png/capibara.png',
                                  width: 36.w,
                                  height: 36.h,
                                ),
                                title: Text(
                                  'SatoshiSeeker',
                                  style: GoogleFonts.urbanist(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 1.50,
                                  ),
                                ),
                                trailing: InkWell(
                                  onTap: () {
                                    _toggleAppBarExpansion();
                                  },
                                  child: SvgPicture.asset(
                                      'assets/svg/back_button.svg'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Divider(
                                  color: NeoColors.soonColor.withOpacity(0.1),
                                  thickness: 1.0,
                                ),
                              ),
                              CustomTabBar(
                                tabs: data,
                                controller: _tabController,
                                type: false,
                                padding:
                                    EdgeInsets.only(left: 16.0.w, right: 16.w),
                                secondText: true,
                              ),
                            ],
                          ),
                        ],
                      )
                    : const SizedBox(),
                background: ListView(
                  physics: const NeverScrollableScrollPhysics(),
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
                                  child: SvgPicture.asset(
                                      'assets/svg/back_button.svg'),
                                ),
                              ),
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
                              padding:
                                  const EdgeInsets.only(left: 28.0, right: 28)
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
                                      color: const Color.fromRGBO(
                                          47, 145, 151, 0.1)),
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
                              child: Divider(
                                color: NeoColors.soonColor.withOpacity(0.1),
                                thickness: 1.0,
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
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
          body: Column(
            children: [
              _isShrink ? SizedBox(height: 182.h) : const SizedBox(),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        return const PostWidget();
                      },
                    ),
                    ListView(
                      children: const [
                        PostWidget(),
                      ],
                    ),
                    MediaWidget(),
                    ListView.builder(
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
      ),
    );
  }
}


