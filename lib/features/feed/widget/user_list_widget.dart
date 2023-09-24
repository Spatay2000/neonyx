import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonyx/features/common/neo_colors.dart';

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
