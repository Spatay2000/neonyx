import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonyx/features/common/neo_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/neo_colors.dart';
import '../../common/neo_scaffold.dart';
import '../../user_space/user_space_screen.dart';
import 'claim_username_search.dart';

class ClaimUsername extends StatefulWidget {
  const ClaimUsername({super.key});

  @override
  State<ClaimUsername> createState() => _ClaimUsernameState();
}

class _ClaimUsernameState extends State<ClaimUsername> {
  TextEditingController usernameController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
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

  saveUsername() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('username', usernameController.text);
    await prefs.setBool('logged', true);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const UserSpaceScreen()));
  }

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NeoScaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          // title: Row(
          //   children: [
          //     const Spacer(),
          //     SizedBox(
          //       width: 20.w,
          //     ),
          //     const Spacer(),
          //     InkWell(
          //       onTap: () => Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) => const UserSpaceScreen())),
          //       child: Text(
          //         'Skip',
          //         style: GoogleFonts.urbanist(
          //             color: Colors.white,
          //             fontSize: 16.sp,
          //             fontWeight: FontWeight.w400),
          //       ),
          //     )
          //   ],
          // ),
          backgroundColor: Colors.transparent,
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 111.w, top: 90.h),
            child: SvgPicture.asset('assets/svg/bg_claim.svg'),
          ),
          Padding(
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
                    'Own your username',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.urbanist(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: [
                            TextSpan(
                              text:
                                  'You can register and own your username, you only need to pay only ',
                              style: GoogleFonts.urbanist(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: NeoColors.primaryColor),
                            ),
                            TextSpan(
                              text: 'transaction commission',
                              style: GoogleFonts.urbanist(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: NeoColors.primaryColor),
                            )
                          ]),
                        ),
                        SizedBox(
                          height: 19.h,
                        ),
                        Text(
                          'Check out our docs',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.urbanist(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: NeoColors.primaryColor),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 45.w),
                          height: 1,
                          color: NeoColors.primaryColor,
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  CustomButton(
                    onPressed: () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ClaimUsernameAccept()),
                        (route) => false),
                    backgroundStatus: false,
                    title: 'Register username via transaction',
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 31.h, horizontal: 50.w),
                    child: Text(
                      'Don’t use blockchain username',
                      style: GoogleFonts.urbanist(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
