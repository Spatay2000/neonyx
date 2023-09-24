import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/neo_colors.dart';
import '../../common/neo_scaffold.dart';
import '../../user_space/user_space_screen.dart';

class ClaimUsernameAccept extends StatefulWidget {
  const ClaimUsernameAccept({super.key});

  @override
  State<ClaimUsernameAccept> createState() => _ClaimUsernameAcceptState();
}

class _ClaimUsernameAcceptState extends State<ClaimUsernameAccept>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3), // Длительность анимации
    );

    _rotationAnimation = Tween(begin: 0.0, end: 1.0).animate(_controller!)
      ..addListener(() {
        setState(() {
          // Повторяющееся обновление состояния для анимации вращения
        });
      });

    _controller!.repeat(reverse: true); // Начать анимацию повторно
  }

  final TextEditingController _textController = TextEditingController();
  bool result = false;
  String validationError = " ";
  void _validateInput(String input) {
    if (input.length < 5) {
      setState(() {
        validationError = "Minimum length is 5 characters";
        result = false;
      });
    } else if (input.contains(" ") ||
        input.contains(RegExp(r'[!@#$%^&*()_+[\]{};’:\”,.<>?]'))) {
      setState(() {
        validationError = "Invalid format for name";
        result = false;
      });
    } else {
      setState(() {
        validationError = "Checking name";
        Future.delayed(const Duration(seconds: 3), () {
          setState(() {
            result = true;
            validationError = "Avaliable";
          });
        });
      });
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _controller!.dispose();
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
          title: Row(
            children: [
              const Spacer(),
              SizedBox(
                width: 20.w,
              ),
              const Spacer(),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserSpaceScreen())),
                child: Text(
                  'Skip',
                  style: GoogleFonts.urbanist(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
          backgroundColor: Colors.transparent,
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 111.w, top: 90.h),
            child: SvgPicture.asset('assets/svg/bg_claim_user.svg'),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              top: 215.h,
            ),
            child: Center(
              child: Column(
                children: [
                  SvgPicture.asset('assets/svg/claim_username.svg'),
                  SizedBox(
                    height: 35.h,
                  ),
                  Text(
                    'Search for a name',
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
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: [
                            TextSpan(
                              text:
                                  'You can use english letter & basic math symbols, but not punctuation',
                              style: GoogleFonts.urbanist(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: NeoColors.primaryColor),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 13.h, horizontal: 16.w),
                    height: 60.h,
                    width: 328.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(47, 145, 151, 1),
                      ),
                      color: const Color.fromRGBO(13, 23, 22, 1),
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: TextFormField(
                      autofocus: true,
                      controller: _textController,
                      onChanged: _validateInput,
                      style: GoogleFonts.urbanist(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: NeoColors.primaryColor),
                      decoration: InputDecoration(
                        suffixIcon: result == false
                            ? SvgPicture.asset('assets/svg/arrow_right_ios.svg')
                            : InkWell(
                                onTap: () => Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const UserSpaceScreen()),
                                    (route) => false),
                                child: SvgPicture.asset(
                                    'assets/svg/right_white.svg'),
                              ),
                        suffixIconConstraints:
                            BoxConstraints(minWidth: 14.w, minHeight: 14.h),
                        // suffix: Icon(Icons.abc,color: Colors.amber,),
                        // SvgPicture.asset('assets/svg/arrow_right_ios.svg'),
                        hintText: 'Search name',
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
                    height: 7.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (validationError
                            .contains('Minimum length is 5 characters')) ...[
                          const SizedBox()
                        ] else if (validationError
                            .contains('Invalid format for name')) ...[
                          SvgPicture.asset(
                            'assets/svg/error_claim.svg',
                            width: 12.w, // Ширина
                            height: 12.h,
                          )
                        ] else ...[
                          result == false
                              ? Transform.rotate(
                                  angle: _rotationAnimation!.value *
                                      2.0 *
                                      3.14159265359, // Здесь можно установить угол вращения
                                  child: Transform.rotate(
                                    angle: 0.5, // Угол вращения
                                    child: SvgPicture.asset(
                                      'assets/svg/checking.svg',
                                      allowDrawingOutsideViewBox:
                                          true, // Разрешить рисовать за пределами viewBox
                                      width: 12.w, // Ширина
                                      height: 12.h, // Высота
                                    ),
                                  ),
                                )
                              : SvgPicture.asset(
                                  'assets/svg/checked.svg',
                                  width: 14.w, // Ширина
                                  height: 14.h, // Высота
                                ),
                        ],
                        SizedBox(width: 8.w),
                        Text(
                          validationError,
                          style: GoogleFonts.urbanist(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ],
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
