import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonyx/features/auth/screen/mnemotic_private.dart';
import 'package:neonyx/features/common/neo_button.dart';
import 'package:neonyx/features/common/neo_colors.dart';

class LoginBottomSheet extends StatefulWidget {
  const LoginBottomSheet({super.key});

  @override
  State<LoginBottomSheet> createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 10.h, left: 16.w, right: 16.w),
        height: 400.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(47, 145, 151, 0.2),
                  Color.fromRGBO(121, 214, 152, 0)
                ])),
        child: Column(
          children: [
            Container(
              width: 60.w,
              height: 4.h,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(124, 167, 170, 1),
                  borderRadius: BorderRadius.circular(20)),
            ),
            SizedBox(
              height: 34.h,
            ),
            Text(
              'Import decentralized digital identity',
              textAlign: TextAlign.center,
              style: GoogleFonts.urbanist(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: NeoColors.primaryColor),
            ),
            SizedBox(
              height: 36.h,
            ),
            CustomButton(
              backgroundStatus: false,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MnematicOrPrivateScreen(
                    statusPage: true,
                  ),
                ),
              ),
              title: 'Mnemonic phrase',
            ),
            SizedBox(
              height: 12.h,
            ),
            CustomButton(
              backgroundStatus: false,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MnematicOrPrivateScreen(
                    statusPage: false,
                  ),
                ),
              ),
              title: 'Private key',
            ),
            SizedBox(
              height: 36.h,
            ),
            Text(
              'Import decentralized digital identity',
              textAlign: TextAlign.center,
              style: GoogleFonts.urbanist(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: NeoColors.primaryColor),
            ),
            SizedBox(
              height: 36.h,
            ),
            CustomButton(
              backgroundStatus: true,
              onPressed: () => null,
              title: 'Issue a decentralized identity ',
            ),
          ],
        ),
      ),
    );
  }
}
