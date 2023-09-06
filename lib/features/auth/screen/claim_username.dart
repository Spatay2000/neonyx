import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonyx/features/common/neo_button.dart';

import '../../common/neo_colors.dart';
import '../../common/neo_scaffold.dart';

class ClaimUsername extends StatefulWidget {
  const ClaimUsername({super.key});

  @override
  State<ClaimUsername> createState() => _ClaimUsernameState();
}

class _ClaimUsernameState extends State<ClaimUsername> {
  TextEditingController usernameController = TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    usernameController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      isButtonEnabled = usernameController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NeoScaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Row(
            children: [
              const Spacer(),
              SizedBox(
                width: 20.w,
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
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/png/bg_username.png'), fit: BoxFit.cover),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 300.h),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 3.w),
                  SvgPicture.asset('assets/svg/check.svg'),
                ],
              ),
              SizedBox(
                height: 14.h,
              ),
              SvgPicture.asset('assets/svg/claim_username.svg'),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Claim your username',
                textAlign: TextAlign.center,
                style: GoogleFonts.urbanist(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              SizedBox(
                height: 28.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                height: 60.h,
                width: 328.w,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(13, 23, 22, 1),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: TextFormField(
                  autofocus: true,
                  controller: usernameController,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.urbanist(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: NeoColors.primaryColor),
                  decoration: InputDecoration(
                    hintText: 'Insert your username',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintStyle: GoogleFonts.urbanist(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: NeoColors.primaryColor),
                  ),
                ),
              ),
              SizedBox(
                height: 17.h,
              ),
              Opacity(
                opacity: isButtonEnabled == true ? 1 : 0.3,
                child: CustomButton(
                  onPressed: () =>
                      isButtonEnabled == true ? log('ketti') : null,
                  backgroundStatus: false,
                  title: 'Claim this username',
                ),
              ),
              SizedBox(
                height: 43.h,
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
      ),
    );
  }
}
