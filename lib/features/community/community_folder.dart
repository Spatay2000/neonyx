import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonyx/features/chat/widgets/chat_list_widget.dart';
import 'package:neonyx/features/common/neo_scaffold.dart';
import 'package:neonyx/features/community/community_details.dart';

import '../common/neo_colors.dart';

class CommunityFolder extends StatefulWidget {
  const CommunityFolder({super.key});

  @override
  State<CommunityFolder> createState() => _CommunityFolderState();
}

class _CommunityFolderState extends State<CommunityFolder> {
  List<NavigationDetails> navigationDetails = [
    const NavigationDetails(
        imagePath: 'assets/png/sim.png',
        title: 'World',
        subtitle: 'Fast fiat-to-crypto P2P'),
    const NavigationDetails(
        imagePath: 'assets/png/nav_icon1.png',
        title: 'Community news',
        subtitle: 'Taxi without any comissions'),
  ];
  @override
  Widget build(BuildContext context) {
    return NeoScaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(
              height: 45.h,
            ),
            Row(
              children: [
                const BackButton(
                  color: Colors.white,
                ),
                const Spacer(),
                Text(
                  'World Wide Community',
                  style: GoogleFonts.urbanist(
                      color: NeoColors.primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp),
                ),
                const Spacer(),
                Image.asset(
                  'assets/png/community.png',
                  width: 28.w,
                  height: 28.h,
                )
              ],
            ),
            SizedBox(height: 16.h,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.r),
                  color: const Color.fromRGBO(47, 145, 151, 0.1)),
              child: Row(
                children: [
                  Image.asset(
                    'assets/png/sim.png',
                    width: 44.w,
                    height: 44.h,
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'News',
                        style: GoogleFonts.urbanist(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp),
                      ),
                      Text(
                        'Fast fiat-to-crypto P2P',
                        style: GoogleFonts.urbanist(
                            color: NeoColors.primaryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            ContainerBlack(
              height: 173.h,
              navigationDetails: navigationDetails,
            ),
            SizedBox(
              height: 18.h,
            ),
            ChatListWidget(),
          ],
        ),
      ),
    ));
  }
}
