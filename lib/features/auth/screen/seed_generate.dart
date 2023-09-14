import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonyx/features/auth/screen/verify.dart';
import 'package:neonyx/features/common/neo_button.dart';
import 'package:neonyx/features/common/neo_scaffold.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/neo_colors.dart';

class SeedGenerate extends StatefulWidget {
  const SeedGenerate({super.key});

  @override
  State<SeedGenerate> createState() => _SeedGenerateState();
}

class _SeedGenerateState extends State<SeedGenerate> {
  List<String> mnemonic = [];
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  void initState() {
    seedGenerate();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  seedGenerate() async {
    final SharedPreferences prefs = await _prefs;
    String randomMnemonic = bip39.generateMnemonic();
    mnemonic = randomMnemonic.split(" ");
    await prefs.setStringList('mnemonic_phrase', mnemonic);
    setState(() {
      print(mnemonic);
    });
  }

  @override
  Widget build(BuildContext context) {
    return NeoScaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: true,
          title: Row(
            children: [
              const Spacer(),
              SizedBox(
                width: 20.w,
              ),
              Text(
                'Identity created',
                style: GoogleFonts.urbanist(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: NeoColors.primaryColor),
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
            image: AssetImage('assets/png/bg_identity.png'), fit: BoxFit.cover),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 268.h),
        child: Center(
          child: Column(
            children: [
              Text(
                'Your access phrase',
                textAlign: TextAlign.center,
                style: GoogleFonts.urbanist(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              SizedBox(height: 2.h),
              Text(
                'Now you can backup your keys',
                textAlign: TextAlign.center,
                style: GoogleFonts.urbanist(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: NeoColors.primaryColor),
              ),
              SizedBox(height: 82.h),
              SvgPicture.asset('assets/svg/warning.svg'),
              SizedBox(height: 11.h),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Do not ",
                      style: GoogleFonts.urbanist(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    TextSpan(
                      text:
                          "screenshot or copy it to the clipboard, using cloud or send this phrase to anyone!",
                      style: GoogleFonts.urbanist(
                          color: NeoColors.primaryColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                    )
                  ])),
              SizedBox(height: 32.h),
              GridView.count(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                childAspectRatio: 2.8.w,
                mainAxisSpacing: 8.h,
                crossAxisSpacing: 8.w,
                crossAxisCount: 3,
                children: List.generate(
                    mnemonic.length,
                    (index) => Container(
                          padding: EdgeInsets.only(left: 8.w, top: 10.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.r),
                            color: Color.fromRGBO(13, 23, 22, 1),
                          ),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: '${index + 1}.  ',
                                style: GoogleFonts.urbanist(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: NeoColors.primaryColor),
                              ),
                              TextSpan(
                                text: mnemonic[index],
                                style: GoogleFonts.urbanist(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              )
                            ]),
                          ),
                        )),
              ),
              SizedBox(height: 16.h),
              CustomButton(
                backgroundStatus: true,
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VerifyScreen())),
                title: 'Next step',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
