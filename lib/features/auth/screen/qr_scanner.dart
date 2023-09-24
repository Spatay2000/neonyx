import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:neonyx/features/common/neo_button.dart';

import '../../common/neo_colors.dart';
import '../widget/barcode_overlay.dart';

class MobilScanner extends StatefulWidget {
  MobilScanner({Key? key}) : super(key: key);

  @override
  State<MobilScanner> createState() => _MobilScannerState();
}

class _MobilScannerState extends State<MobilScanner> {
  MobileScannerController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w),
        child: CustomButton(
          height: 60.h,
          backgroundStatus: false,
          title: 'Import gallery image',
          onPressed: () => null,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: NeoColors.soonColor),
          title: Column(
            children: [
              Text(
                'Scan QR-code AppBar',
                style: GoogleFonts.urbanist(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              Text(
                'World wide community',
                style: GoogleFonts.urbanist(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: NeoColors.primaryColor),
              ),
            ],
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black,
                  Color.fromRGBO(19, 44, 39, 1),
                ],
              ),
            ),
          )),
      body: Stack(
        children: [
          MobileScanner(
              controller: MobileScannerController(),
              onDetect: (barcode, index) async {
                log("sake");
              }),
          QRScannerOverlay(overlayColour: Colors.black.withOpacity(0.5)),
          Padding(
            padding: EdgeInsets.only(left: 58.w, right: 58.w, top: 500.h),
            child: Text(
              'Hold your device so that the QR code appears in the square viewfinder in the middle',
              textAlign: TextAlign.center,
              style: GoogleFonts.urbanist(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
