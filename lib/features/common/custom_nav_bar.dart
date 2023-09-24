import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonyx/features/common/neo_colors.dart';

class CustomNavigationBar extends StatelessWidget {
  final List<NavigationBarItem> items;
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavigationBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(47, 145, 151, 0.3),
          borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(left: 16.0, right: 16.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(items.length, (index) {
                  return InkWell(
                    onTap: () => onTap(index),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(items[index].icon,
                            color: Colors.white),
                        Container(
                          margin: const EdgeInsets.only(top: 6),
                          width: 36,
                          height: 4,
                          decoration: BoxDecoration(
                              color: index == currentIndex
                                  ? NeoColors.primaryColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(2)),
                        )
                        // Text(
                        //   items[index].title,
                        //   style: TextStyle(
                        //     color: index == currentIndex ? Colors.white : Colors.grey,
                        //   ),
                        // ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            CircleAvatar(
              radius: 3.r,
              backgroundColor: Color.fromRGBO(47, 145, 151, 1),
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              'Synced',
              style: GoogleFonts.urbanist(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}

class NavigationBarItem {
  final String icon;

  NavigationBarItem({
    required this.icon,
  });
}
