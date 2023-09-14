import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonyx/features/common/neo_colors.dart';
import 'package:neonyx/features/common/neo_scaffold.dart';
import 'package:neonyx/features/feed/data/models/media_item.dart';
import 'package:neonyx/features/feed/widget/feed_show_modal_widget.dart';
import 'package:neonyx/features/feed/widget/video_item.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({
    super.key,
  });

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  int _currentIndex = 0;
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
    bool scroll = true;
    _items.length == 1 ? scroll = false : scroll = true;
    return NeoScaffold(
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
                  "Media posts",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "SatoshiSeeker",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: NeoColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: _items.length + _itemsPhoto.length,
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            if (index < _itemsPhoto.length) {
              return Column(
                children: [
                  const UserListTIleWidget(),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16.0, right: 16, bottom: 22)
                            .r,
                    child: Text.rich(
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
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      viewportFraction: 1,
                      autoPlay: scroll,
                      enlargeCenterPage: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      aspectRatio: 12 / 12,
                      onPageChanged: (index, _) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    items: _itemsPhoto[index].image.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Image.asset(
                            i,
                            fit: BoxFit.cover,
                          );
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  _itemsPhoto[index].image == []
                      ? const SizedBox()
                      : Align(
                          alignment: Alignment.topCenter,
                          child: DotsIndicator(
                            dotsCount: _itemsPhoto[index].image.length ?? 0,
                            position: _currentIndex,
                            decorator: const DotsDecorator(
                              color: Color.fromARGB(255, 24, 107, 112),
                              activeSize: Size.square(
                                  14), // Color of non-selected indicators
                              activeColor: Color(
                                  0xFF2F9096), // Color of selected indicator
                            ),
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
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
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Divider(
                      color: NeoColors.soonColor.withOpacity(0.1),
                      thickness: 1,
                    ),
                  ),
                ],
              );
            } else {
              final int videoIndex = index - _itemsPhoto.length;
              return Column(
                children: [
                  const UserListTIleWidget(),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16.0, right: 16, bottom: 22)
                            .r,
                    child: Text.rich(
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
                  ),
                  VideoItem(
                    videoUrl: _items[videoIndex].image.first,
                    type: true,
                    auto: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
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
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Divider(
                      color: NeoColors.soonColor.withOpacity(0.1),
                      thickness: 1,
                    ),
                  ),
                ],
              );
            }
          },
        ));
  }
}
