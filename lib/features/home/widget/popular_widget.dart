import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonyx/features/common/neo_colors.dart';
import 'package:neonyx/features/home/data/models/banner_local_model.dart';

import 'popular_show_modal_widget.dart';

class PopularWidget extends StatefulWidget {
  const PopularWidget({
    super.key,
  });

  @override
  State<PopularWidget> createState() => _PopularWidgetState();
}

class _PopularWidgetState extends State<PopularWidget> {
  int _currentIndex = 0;

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  List<BannerLocalModel> list = [
    BannerLocalModel(
      title: 'NeoPeer | P2P exchange',
      subtitle: 'Fast fiat-to-crypto P2P',
      url: 'assets/png/avatar.png',
    ),
    BannerLocalModel(
      title: 'Carry',
      subtitle: 'Taxi without any comissions',
      url: 'assets/png/carry.png',
    ),
    BannerLocalModel(
        title: 'Imaginarium',
        url: 'assets/png/imaganarium.png',
        subtitle: 'NFT marketplace'),
    BannerLocalModel(
        title: 'NeoDrive', url: 'assets/png/neo.png', subtitle: 'File manager'),
    BannerLocalModel(
      title: 'Bitroom',
      subtitle: 'Borrow and Lend Cryptos Instantly',
      url: 'assets/png/bitroom.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    bool scroll = true;
    imgList.length == 1 ? scroll = false : scroll = true;
    return Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16,
          top: 24,
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 100.h,
              child: CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  autoPlay: scroll,
                  enlargeCenterPage: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  aspectRatio: 62 / 12,
                  onPageChanged: (index, _) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: imgList.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Stack(
                        clipBehavior: Clip.none,
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Container(
                            width: 1.sw,
                            decoration: ShapeDecoration(
                              color: const Color(0xFF090F0B),
                              // color: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            padding: const EdgeInsets.only(
                              left: 16,
                              top: 27,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Marketplace',
                                  style: GoogleFonts.urbanist(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 1.40,
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.80,
                                  child: Text(
                                    'Buy any goods directly with your crypto',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.urbanist(
                                      color: NeoColors.primaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      height: 1.40,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                              left: 250,
                              top: -10,
                              child: Image.asset(
                                'assets/png/330.png',
                                fit: BoxFit.cover,
                              )),
                        ],
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            imgList == []
                ? const SizedBox()
                : Align(
                    alignment: Alignment.topCenter,
                    child: DotsIndicator(
                      dotsCount: imgList.length ?? 0,
                      position: _currentIndex,
                      decorator: const DotsDecorator(
                        color: Color.fromARGB(255, 24, 107, 112),
                        activeSize:
                            Size.square(14), // Color of non-selected indicators
                        activeColor:
                            Color(0xFF2F9096), // Color of selected indicator
                      ),
                    ),
                  ),
            SizedBox(
              height: 20.h,
            ),
            Container(
                padding: const EdgeInsets.all(16),
                decoration: ShapeDecoration(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: list.length,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            useRootNavigator: true,
                            isDismissible: true,
                            backgroundColor: const Color(0xFF090F0B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            builder: (context) {
                              // return const FeedShowModalWidget();
                              return FractionallySizedBox(
                                heightFactor: 0.87,
                                child: PopularShowModalWidget(
                                  url: list[index].url,
                                  title: list[index].title,
                                ),
                              );
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                        child: BlackContainerWidget(
                          image: list[index].url,
                          title: list[index].title,
                          subTitle: list[index].subtitle ?? '',
                        ),
                      ),
                    );
                  },
                )),
            SizedBox(
              height: 26.h,
            ),
            const Center(
              child: SizedBox(
                width: 214,
                child: Opacity(
                  opacity: 0.80,
                  child: Text(
                    'Can’t find any app you need? Please welcome to our API documentation to create your one!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF70A39D),
                      fontSize: 12,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w400,
                      height: 1.40,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 26.h,
            ),
          ],
        ));
  }
}

class BlackContainerWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  const BlackContainerWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 44,
          height: 44,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF303239),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.urbanist(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.40,
                ),
              ),
              Opacity(
                opacity: 0.80,
                child: Text(
                  subTitle,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.urbanist(
                    color: NeoColors.primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.40,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
