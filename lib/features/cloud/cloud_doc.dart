import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonyx/features/common/neo_button.dart';
import 'package:neonyx/features/common/neo_colors.dart';

import 'cloud_files.dart';

class CloudDoc extends StatefulWidget {
  const CloudDoc({super.key});

  @override
  State<CloudDoc> createState() => _CloudDocState();
}

class _CloudDocState extends State<CloudDoc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: Image.asset(
                        'assets/png/graph.png',
                        fit: BoxFit.fitWidth,
                        height: 220.h,
                        width: 320.w,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 180.h),
                      child: SizedBox(
                        child: CloudContainerList(
                          docLists: docList,
                          subTitle: 'Manage privacy settings',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: const Color.fromRGBO(47, 145, 151, 0.1),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/svg/logo.svg'),
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'NeonyxCloud | 100 GB',
                                    style: GoogleFonts.urbanist(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Text(
                                    'Subscription active',
                                    style: GoogleFonts.urbanist(
                                        color: NeoColors.primaryColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const Icon(
                            Icons.more_vert,
                            color: NeoColors.primaryColor,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      CustomButton(
                        height: 42.h,
                        onPressed: () => null,
                        backgroundStatus: true,
                        title: 'Manage plan',
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: const Color.fromRGBO(47, 145, 151, 0.1),
                  ),
                  child: ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Documents',
                                      style: GoogleFonts.urbanist(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Text(
                                      'Subscription active',
                                      style: GoogleFonts.urbanist(
                                          color: const Color.fromRGBO(
                                              255, 255, 255, 0.4),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 6.h,
                                  width: 158.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    color:
                                        const Color.fromRGBO(47, 145, 151, 0.1),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 40.w,
                                        height: 6.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            gradient:
                                                const LinearGradient(colors: [
                                              Color.fromRGBO(47, 145, 151, 1),
                                              Color.fromRGBO(183, 175, 107, 1),
                                            ])),
                                      ),
                                      const SizedBox()
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                      separatorBuilder: (context, index) => Opacity(
                            opacity: 0.1,
                            child: Container(
                              width: double.infinity,
                              color: const Color.fromRGBO(47, 145, 151, 1),
                              height: 1.h,
                            ),
                          ),
                      itemCount: 5),
                )
              ],
            ),
          ),
        ));
  }
}
