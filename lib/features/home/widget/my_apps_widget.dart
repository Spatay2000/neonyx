import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonyx/features/common/neo_colors.dart';
import 'package:neonyx/features/home/data/models/banner_local_model.dart';

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
        physics: const BouncingScrollPhysics(),
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 80.r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    decoration: ShapeDecoration(
                      color: const Color(0xFF090F0B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    padding: const EdgeInsets.only(
                      left: 13,
                      right: 13,
                    ).r,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Opacity(
                              opacity: 0.80,
                              child: Text(
                                'Your area',
                                style: GoogleFonts.urbanist(
                                  color: NeoColors.primaryColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  height: 1.40.h,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            Text(
                              '24°C',
                              style: GoogleFonts.urbanist(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.40.h,
                              ),
                            ),
                          ],
                        ),
                        Image.asset('assets/png/cloud sun.png')
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 17.r,
                ),
                Expanded(
                  child: Container(
                    // padding: const EdgeInsets.only(
                    //   left: 12,
                    //   right: 15,
                    //   top: 16,
                    //   bottom: 19,
                    // ).r,
                    padding: const EdgeInsets.only(
                      left: 13,
                      right: 13,
                    ).r,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF090F0B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 1.sw,
                          child: Row(
                            children: [
                              Expanded(
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Positioned(
                                      child: Row(
                                        children: [
                                          Image.asset('assets/png/bit.png'),
                                          SizedBox(
                                            width: 3.r,
                                          ),
                                          Opacity(
                                            opacity: 0.80,
                                            child: Text(
                                              'Bitcoin',
                                              style: GoogleFonts.urbanist(
                                                color: Colors.white,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                height: 1.40.h,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      top: 3.r,
                                      width: 100.r,
                                      height: 22.r,
                                      child: Image.asset(
                                        'assets/png/statistics.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 3.r,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$2,203,468',
                              style: GoogleFonts.urbanist(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.40.h,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(7, 1, 9, 2).r,
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
                              child: Text(
                                '+145.6',
                                style: GoogleFonts.urbanist(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  height: 1.4.h,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
                  // onTap: () {},
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
