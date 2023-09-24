import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonyx/features/common/neo_colors.dart';

import 'package:neonyx/features/feed/widget/user_list_widget.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UserListTIleWidget(),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16),
          child: Column(
            children: [
              Text.rich(
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
              SizedBox(
                height: 16.h,
              ),
              Image.asset(
                'assets/png/media.png',
                width: 1.sw,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
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
              )
            ],
          ),
        ),
      ],
    );
  }
}
