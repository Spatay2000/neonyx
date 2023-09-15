import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonyx/features/auth/widget/login_bottom_sheet.dart';
import 'package:neonyx/features/common/neo_button.dart';
import 'package:neonyx/features/common/neo_scaffold.dart';

import '../../common/neo_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NeoScaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Row(
            children: [
              const Spacer(),
              SizedBox(
                width: 20.w,
              ),
              Text(
                'Login',
                style: GoogleFonts.urbanist(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: NeoColors.primaryColor),
              ),
              const Spacer(),
              Text(
                'Skip',
                style: GoogleFonts.urbanist(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
          backgroundColor: Colors.transparent,
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 82.w, vertical: 130.h),
            child: SvgPicture.asset('assets/svg/bg_login.svg'),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 320.h),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 37.w,
                    right: 36.w,
                  ),
                  child: Text(
                    'Connect to the internet of the future',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.urbanist(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 112.h,
                ),
                CustomButton(
                  onPressed: () async => showModalBottomSheet(
                      context: context,
                      backgroundColor: const Color(0xFF090F0B),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topRight: Radius.circular(24.r),
                        topLeft: Radius.circular(24.r),
                      )),
                      builder: (context) => const LoginBottomSheet()),
                  title: 'In-app login',
                  subtitle: 'Create or import a software wallet',
                  backgroundStatus: true,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 8.h, right: 8.w),
                        height: 16.h,
                        width: 39.w,
                        decoration: BoxDecoration(
                            color: NeoColors.soonColor,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Center(
                          child: Text(
                            'Soon',
                            style: GoogleFonts.urbanist(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        )),
                    const Opacity(
                      opacity: 0.3,
                      child: CustomButton(
                        backgroundStatus: true,
                        title: 'Hardware token',
                        subtitle: 'Pair with your hardware wallet',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 48.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 57.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'What’s the difference between in-app and hardware authorisation?',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.urbanist(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: NeoColors.primaryColor),
                      ),
                      SizedBox(
                        height: 19.h,
                      ),
                      Text(
                        'Check out our docs',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.urbanist(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: NeoColors.primaryColor),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 55.w),
                        height: 1.h,
                        color: NeoColors.primaryColor,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
