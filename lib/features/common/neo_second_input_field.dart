import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'neo_colors.dart';

class NeoSecondInputField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;
  final bool prefix;
  final bool suffix;
  const NeoSecondInputField(
      {super.key,
      required this.controller,
      required this.title,
      this.prefix = false,
      this.suffix = false,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 5.5.h,
      ),
      width: 328.w,
      height: 52.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(47, 145, 151, 1),
        ),
        color: const Color.fromRGBO(13, 23, 22, 1),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.urbanist(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: NeoColors.primaryColor),
                ),
                Expanded(
                  child: TextFormField(
                    cursorColor: Colors.white,
                    autofocus: true,
                    controller: controller,
                    style: GoogleFonts.urbanist(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                    decoration: InputDecoration(
                      prefixText: prefix == false ? null : '@',
                      prefixStyle: GoogleFonts.urbanist(
                          color: NeoColors.soonColor, fontSize: 14.sp),
                      hintText: hintText,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintStyle: GoogleFonts.urbanist(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          suffix == false
              ? const SizedBox()
              : const Icon(
                  Icons.arrow_forward_ios,
                  color: NeoColors.soonColor,
                )
        ],
      ),
    );
  }
}
