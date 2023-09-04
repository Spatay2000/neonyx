
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonyx/features/auth/screen/qr_scanner.dart';
import 'package:neonyx/features/common/neo_button.dart';
import 'package:neonyx/features/common/neo_scaffold.dart';
import 'package:bip39/bip39.dart' as bip39;

import '../../common/neo_colors.dart';

class MnematicOrPrivateScreen extends StatefulWidget {
  final bool statusPage;
  const MnematicOrPrivateScreen({super.key, required this.statusPage});

  @override
  State<MnematicOrPrivateScreen> createState() =>
      _MnematicOrPrivateScreenState();
}

class _MnematicOrPrivateScreenState extends State<MnematicOrPrivateScreen> {
  TextEditingController mnemonicPhraseController = TextEditingController();

  void validateMnemonic(String mnemonic) {
    String randomMnemonic = bip39.generateMnemonic();
    print(randomMnemonic);
    var isValid = bip39.validateMnemonic(mnemonic);
    print(isValid);
  }

  @override
  Widget build(BuildContext context) {
    return NeoScaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: NeoColors.soonColor),
          centerTitle: true,
          titleTextStyle: GoogleFonts.urbanist(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: NeoColors.primaryColor),
          title: widget.statusPage == true
              ? const Text('Mnemonic phrase')
              : const Text('Private key'),
          backgroundColor: Colors.transparent,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(left: 16.w, right: 16.w, bottom: 42.h, top: 96.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              widget.statusPage == true
                  ? SvgPicture.asset('assets/svg/mnemotic_image.svg')
                  : SvgPicture.asset('assets/svg/private_image.svg'),
              SizedBox(
                height: 46.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                height: 160.h,
                width: 328.w,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(13, 23, 22, 1),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Column(
                  children: [
                    TextFormField(
                      controller: mnemonicPhraseController,
                      autofocus: true,
                      maxLines: 3,
                      style: GoogleFonts.urbanist(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: NeoColors.primaryColor),
                      decoration: InputDecoration(
                        hintText: widget.statusPage == true
                            ? 'A mnemonic phrase could have 12, 15, 18, 21 or 24 words. Please enter and separate them with spaces.'
                            : 'A private key is an alphanumeric code used in cryptography, similar to a password. In cryptocurrency.',
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
                    const Spacer(),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MobilScanner(),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            widget.statusPage == true
                                ? 'Scan QR-code with\na mnemonic phrase'
                                : 'Scan QR-code\nwith a private key',
                            style: GoogleFonts.urbanist(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: NeoColors.primaryColor),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          SvgPicture.asset('assets/svg/qr_scan.svg')
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 11.h),
              CustomButton(
                onPressed: () async {
                  validateMnemonic(mnemonicPhraseController.text);
                },
                backgroundStatus: false,
                title: widget.statusPage == true
                    ? "Import by mnemonic phrase"
                    : "Import by private key",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
