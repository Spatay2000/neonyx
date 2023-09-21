import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonyx/features/common/neo_colors.dart';
import 'package:neonyx/features/home/data/models/banner_local_model.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../cloud/cloud.dart';

class MyAppsWidget extends StatefulWidget {
  const MyAppsWidget({
    super.key,
  });

  @override
  State<MyAppsWidget> createState() => _MyAppsWidgetState();
}

class _MyAppsWidgetState extends State<MyAppsWidget> {
  bool delete = false;
  @override
  Widget build(BuildContext context) {
    List<BannerLocalModel> list = [
      BannerLocalModel(
        title: 'Multipass',
        url: 'assets/png/multipas.png',
      ),
      BannerLocalModel(
        title: 'Contact',
        url: 'assets/png/Avatars.png',
      ),
      BannerLocalModel(
        title: 'Cloud',
        url: 'assets/png/files.png',
      ),
      BannerLocalModel(
        title: 'Notes',
        url: 'assets/png/notes.png',
      ),
      BannerLocalModel(
        title: 'Health',
        url: 'assets/png/health.png',
      ),
      BannerLocalModel(
        title: 'Wallet',
        url: 'assets/png/wallet.png',
      ),
      BannerLocalModel(
        title: 'P2P',
        url: 'assets/png/p2p.png',
      ),
      BannerLocalModel(
        title: 'Goverment',
        url: 'assets/png/goverment.png',
      ),
      // BannerLocalModel(
      //   title: 'Shopping',
      //   url: 'assets/png/shopping.png',
      // ),
      // BannerLocalModel(
      //   title: 'Calendar',
      //   url: 'assets/png/calendar.png',
      // ),
      // BannerLocalModel(
      //   title: 'Calculator',
      //   url: 'assets/png/calc.png',
      // ),
      // BannerLocalModel(
      //   title: 'Explorer',
      //   url: 'assets/png/exploer.png',
      // ),
    ];
    return Padding(
      padding:
          const EdgeInsets.only(left: 16.0, right: 16, top: 24, bottom: 44),
      child: ListView(
        padding: EdgeInsets.zero,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 156,
                height: 80,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 156,
                        height: 80,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF090F0B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        left: 95,
                        top: 19,
                        child: Image.asset('assets/png/cloud sun.png')),
                    Positioned(
                      left: 13,
                      top: 44,
                      child: Text(
                        '24°C',
                        style: GoogleFonts.urbanist(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.40,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 12,
                      top: 21,
                      child: Opacity(
                        opacity: 0.80,
                        child: Text(
                          'Your area',
                          style: GoogleFonts.urbanist(
                            color: NeoColors.primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            height: 1.40,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 156,
                height: 80,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 156,
                        height: 80,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF090F0B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 96,
                      top: 37,
                      child: SizedBox(
                        width: 48,
                        height: 20,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 48,
                                height: 20,
                                decoration: ShapeDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment(-1.00, 0.00),
                                    end: Alignment(1, 0),
                                    colors: [
                                      Color(0xFF3F6762),
                                      Color(0xFF2F9096)
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13.95),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 6.98,
                              top: 1,
                              child: Text(
                                '+145.6',
                                style: GoogleFonts.urbanist(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  height: 1.40,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 12,
                      top: 42,
                      child: Text(
                        '\$2,203,468',
                        style: GoogleFonts.urbanist(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.40,
                        ),
                      ),
                    ),
                    Positioned(
                        left: 42,
                        top: 22,
                        child: Image.asset('assets/png/statistics.png')),
                    Positioned(
                      left: 12,
                      top: 19,
                      child: SizedBox(
                        width: 50,
                        height: 17,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 3,
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https://via.placeholder.com/12x12"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 15,
                              top: 0,
                              child: Opacity(
                                opacity: 0.80,
                                child: Text(
                                  'Bitcoin',
                                  style: GoogleFonts.urbanist(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    height: 1.40,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          GridView.builder(
            itemCount: list.length,
            shrinkWrap: true,
            padding: const EdgeInsets.all(0),
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              // childAspectRatio: (30 / 54).r,
              crossAxisSpacing: 17.0,
              mainAxisSpacing: 1.0,
              mainAxisExtent: 106,
              crossAxisCount: 4,
            ),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  onTap: () {
                    index == 2 ?
                    pushNewScreen(
                      context,
                      screen: const Cloud(),
                      withNavBar: false, // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    ) : null;
                  },
                  onLongPress: () {
                    setState(() {
                      delete = !delete;
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            Image.asset(
                              list[index].url,
                              fit: BoxFit.cover,
                            ),
                            !delete
                                ? const SizedBox()
                                : Positioned(
                                    top: -10,
                                    left: 35,
                                    child: Image.asset('assets/png/delete.png'))
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          list[index].title,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.urbanist(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.40,
                          ),
                        ),
                      ],
                    ),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
