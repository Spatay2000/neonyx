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
import 'package:neonyx/features/feed/widget/test_screen.dart';

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

  final List<MediaItem> _items = [
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
      'assets/png/grid.png',
      'assets/png/grid3.png',
      'assets/png/grid2.png',
      'assets/png/grid3.png',
    ], "Stephan Seeber"),
    MediaItem([
      'assets/png/grid.png',
    ], "Stephan Seeber"),
    MediaItem(
        ['assets/png/grid.png', 'assets/png/grid2.png', 'assets/png/grid3.png'],
        "Stephan Seeber"),
  ];
  late ScrollController _scrollController;
  bool lastStatus = true;
  double height = 500.h;
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
                                child: Container(
                                  width: 1.sw,
                                  height: 1.h,
                                  color: NeoColors.primaryColor,
                                ),
                              ),
                              CustomTabBar(
                                tabs: data,
                                controller: _tabController,
                                type: false,
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
                              child: Container(
                                width: 1.sw,
                                height: 1.h,
                                color: NeoColors.primaryColor,
                              ),
                            ),
                            CustomTabBar(
                              tabs: data,
                              controller: _tabController,
                              type: false,
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
                    MediaWidget(items: _items),
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

class MediaWidget extends StatelessWidget {
  const MediaWidget({
    super.key,
    required List<MediaItem> items,
  }) : _items = items;

  final List<MediaItem> _items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        crossAxisCount: 3,
      ),
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            _items[index].image.length == 1
                ? null
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TestScreen(
                              media: _items[index],
                            )),
                  );
          },
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(_items[index].image.first),
                  ),
                ),
              ),
              _items[index].image.length == 1
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
                            _items[index].image.length.toString(),
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
