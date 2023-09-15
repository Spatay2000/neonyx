import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonyx/features/auth/screen/seed_generate.dart';
import 'package:neonyx/features/auth/widget/progress_circular.dart';
import 'package:neonyx/features/common/neo_scaffold.dart';

import '../../common/neo_colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool timeToNext = false;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        timeToNext = true;
      });
    });
    Future.delayed(const Duration(seconds: 7), () {
      setState(() {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SeedGenerate()));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NeoScaffold(
      extendBodyBehindAppBar: true,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/png/bg_register.png'), fit: BoxFit.cover),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 134.h),
        child: Center(
          child: Column(
            children: [
              timeToNext == false
                  ? GradientProgressIndicator(
                      radius: 58.r,
                      strokeWidth: 8,
                      gradientStops: const [
                        0.05,
                        0.95,
                      ],
                      gradientColors: const [
                        Color.fromRGBO(47, 145, 151, 0),
                        Color(0xFF2F9197)
                      ],
                      child: SvgPicture.asset('assets/svg/profile.svg'),
                    )
                  : SvgPicture.asset('assets/svg/profile_after.svg'),
              SizedBox(
                height: 74.h,
              ),
              Text(
                'Setting up new identity',
                textAlign: TextAlign.center,
                style: GoogleFonts.urbanist(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              SizedBox(height: 2.h),
              Text(
                'Please don’t close app until it will be done',
                textAlign: TextAlign.center,
                style: GoogleFonts.urbanist(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: NeoColors.primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
