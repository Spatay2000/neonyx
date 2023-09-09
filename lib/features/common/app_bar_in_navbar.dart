import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarInNavBar extends StatelessWidget {
  final Widget? actions;
  final String title;
  final Widget? iconNearTitle;
  const AppBarInNavBar({
    super.key,
    this.actions,
    required this.title,
    this.iconNearTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: 18.0.w, right: 18.w, top: 65.h, bottom: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: GoogleFonts.urbanist(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  iconNearTitle ?? const SizedBox()
                ],
              ),
              actions ?? const SizedBox()
            ],
          ),
        ),
      ],
    );
  }
}
