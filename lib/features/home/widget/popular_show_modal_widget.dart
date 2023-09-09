import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonyx/features/common/neo_button.dart';
import 'package:neonyx/features/common/neo_colors.dart';

class PopularShowModalWidget extends StatelessWidget {
  final String title;
  final String url;
  const PopularShowModalWidget({
    super.key,
    required this.title,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.00, -1.00),
          end: Alignment(3, 5),
          colors: [
            Color.fromARGB(255, 16, 77, 80),
            Color.fromARGB(0, 47, 114, 70)
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Opacity(
                  opacity: 0.20,
                  child: Container(
                    width: 60,
                    height: 4,
                    decoration: ShapeDecoration(
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      title,
                      style: GoogleFonts.urbanist(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Image.asset(
                    url,
                    fit: BoxFit.cover,
                  )
                ],
              ),
              SizedBox(
                height: 17.h,
              ),
              Row(
                children: [
                  Opacity(
                    opacity: 0.80,
                    child: Text(
                      '2637 launches',
                      style: GoogleFonts.urbanist(
                        color: NeoColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.40,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    '•',
                    style: GoogleFonts.urbanist(
                      color: NeoColors.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.40,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Opacity(
                    opacity: 0.80,
                    child: Text(
                      'Neonyx',
                      style: GoogleFonts.urbanist(
                        color: NeoColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.40,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 19.h,
              ),
              Container(
                width: 1.sw,
                height: 1.h,
                color: Colors.black,
              ),
              SizedBox(
                height: 19.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    backgroundStatus: true,
                    width: 150.w,
                    title: 'Launch app',
                  ),
                  CustomButton(
                    width: 150.w,
                    backgroundStatus: false,
                    title: 'Uninstall',
                  ),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Text(
                'About this app',
                style: GoogleFonts.urbanist(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  height: 1.29,
                ),
              ),
              SizedBox(
                height: 11.h,
              ),
              Opacity(
                opacity: 0.80,
                child: Text(
                  'Experience the future of ride-hailing with Carry, the decentralized platform empowering drivers, commuters, and community developers through blockchain technology.',
                  style: GoogleFonts.urbanist(
                    color: NeoColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.40,
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.black.withOpacity(0.10000000149011612),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/svg/guard.svg'),
                    SizedBox(
                      height: 12.h,
                    ),
                    SizedBox(
                      width: 296,
                      child: Opacity(
                        opacity: 0.80,
                        child: Text(
                          'Data used while using the app',
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
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/png/min_profile.png'),
                            const SizedBox(width: 8),
                            Text(
                              'Your name',
                              style: GoogleFonts.urbanist(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                height: 1.29,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset('assets/png/iden.png'),
                            const SizedBox(width: 8),
                            Text(
                              'Identity number',
                              style: GoogleFonts.urbanist(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                height: 1.29,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/png/wallet_2.png'),
                        const SizedBox(width: 8),
                        Text(
                          'Wallet address',
                          style: GoogleFonts.urbanist(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            height: 1.29,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 53.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        'assets/png/cover.png',
                        width: 153.w,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset('assets/svg/play_button.svg'),
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      Image.asset(
                        'assets/png/cover.png',
                        width: 153.w,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset('assets/svg/play_button.svg'),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
