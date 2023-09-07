import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:neonyx/features/common/neo_colors.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? title;
  final String? subtitle;
  final bool backgroundStatus;
  final double? height;
  final double? width;

  const CustomButton({
    super.key,
    this.onPressed,
    this.title,
    this.subtitle,
    required this.backgroundStatus,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.0.r),
          border: const GradientBoxBorder(
              gradient: LinearGradient(colors: [
            Color.fromRGBO(47, 145, 151, 1),
            Color.fromRGBO(183, 175, 107, 1),
          ]))),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundStatus == true
              ? NeoColors.buttonBackgroundColor
              : Colors.transparent,
          minimumSize: Size(double.infinity, 60.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0.r), // <-- Radius
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title!,
              style: GoogleFonts.urbanist(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            subtitle != null
                ? SizedBox(
                    height: 4.h,
                  )
                : const SizedBox(),
            subtitle != null
                ? Text(
                    subtitle!,
                    style: GoogleFonts.urbanist(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: NeoColors.primaryColor),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
