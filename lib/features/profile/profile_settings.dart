import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonyx/features/common/neo_button.dart';
import 'package:neonyx/features/common/neo_colors.dart';
import 'package:neonyx/features/common/neo_scaffold.dart';
import 'package:neonyx/features/profile/personal_info.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  List<UserInfo> userInfo = [
    UserInfo(
        title: 'Username',
        iconRight: 'assets/svg/qr_profile.svg',
        subtile: '@satoshiseeker'),
    UserInfo(title: 'Bio', iconRight: null, subtile: 'Golang for everyone')
  ];
  List<UserInfo> userAction = [
    UserInfo(title: null, iconRight: null, subtile: 'Personal info'),
    UserInfo(title: null, iconRight: null, subtile: 'Username service'),
    UserInfo(title: null, iconRight: null, subtile: 'Notifications'),
    UserInfo(title: null, iconRight: null, subtile: 'Privacy settings'),
  ];
  @override
  Widget build(BuildContext context) {
    return NeoScaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.h),
        child: Container(
          padding:
              EdgeInsets.only(top: 50.h, bottom: 10.h, left: 16.w, right: 10.w),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(0, 0, 0, 1),
                Color.fromRGBO(19, 44, 39, 1),
              ],
            ),
          ),
          child: Row(
            children: [
              const BackButton(
                color: NeoColors.soonColor,
              ),
              const Spacer(
                flex: 4,
              ),
              Text(
                'Profile settings',
                style: GoogleFonts.urbanist(
                    color: NeoColors.primaryColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400),
              ),
              const Spacer(
                flex: 6,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.h, left: 16.w, right: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 84.w,
                  height: 84.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(180.0.r),
                  ),
                  child: Image.asset(
                    'assets/png/capibara.png',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'SatoshiSeeker',
                    style: GoogleFonts.urbanist(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Image.asset('assets/png/done.png')
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              UserInfoWidget(
                existIconRight: false,
                userInfoList: userInfo,
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                backgroundStatus: true,
                onPressed: () => pushNewScreen(
                  context,
                  screen: const PersonalInfo(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                ),
                title: 'Manage your data',
              ),
              SizedBox(
                height: 20.h,
              ),
              UserInfoWidget(
                existIconRight: true,
                userInfoList: userAction,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserInfoWidget extends StatelessWidget {
  final List<UserInfo> userInfoList;
  final bool existIconRight;
  const UserInfoWidget(
      {super.key, required this.userInfoList, required this.existIconRight});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            EdgeInsets.only(left: 19.w, top: 7.98.h, right: 16.w, bottom: 16.h),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: userInfoList.length,
            separatorBuilder: (context, index) => Opacity(
                  opacity: 0.1,
                  child: Container(
                    width: double.infinity,
                    color: NeoColors.primaryColor,
                    height: 1.h,
                  ),
                ),
            itemBuilder: (context, index) => Padding(
                  padding:
                      EdgeInsets.only(top: 16.h, bottom: 16.h, right: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          userInfoList[index].title != null
                              ? Text(
                                  userInfoList[index].title!,
                                  style: GoogleFonts.urbanist(
                                      color: const Color.fromRGBO(
                                          112, 164, 157, 1),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                )
                              : const SizedBox(),
                          userInfoList[index].title != null
                              ? SizedBox(
                                  height: 4.h,
                                )
                              : const SizedBox(),
                          Text(
                            userInfoList[index].subtile,
                            style: GoogleFonts.urbanist(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      existIconRight == false
                          ? userInfoList[index].iconRight != null
                              ? SvgPicture.asset(
                                  userInfoList[index].iconRight!,
                                  width: 24.w,
                                  height: 24.h,
                                )
                              : const SizedBox()
                          : SvgPicture.asset('assets/svg/arrow_right.svg')
                    ],
                  ),
                )));
  }
}

class UserInfo {
  final String? title;
  final String subtile;
  final String? iconRight;

  UserInfo(
      {required this.title, required this.iconRight, required this.subtile});
}
