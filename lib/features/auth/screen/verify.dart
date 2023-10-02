import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonyx/features/auth/screen/account_details.dart';
import 'package:neonyx/features/auth/screen/claim_username.dart';
import 'package:neonyx/features/common/neo_button.dart';
import 'package:neonyx/features/common/neo_scaffold.dart';
import 'package:neonyx/features/common/neo_snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/neo_colors.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  List<String>? mnemonic = [];
  List<String> removedItems = [];
  bool clearStatus = false;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  void initState() {
    getData();
    super.initState();
  }

  void onItemTap(String item) {
    int index = mnemonic!.indexOf(item);
    if (index != -1) {
      String removedItem = mnemonic!.removeAt(index);
      removedItems.add(removedItem);
      setState(() {});
    }
  }

  void removeItem(String item) {
    int index = removedItems.indexOf(item);
    if (index != -1) {
      String mnemonics = removedItems.removeAt(index);
      mnemonic!.add(mnemonics);
      setState(() {});
    }
  }

  getData() async {
    final SharedPreferences prefs = await _prefs;
    mnemonic!.clear();
    mnemonic = prefs.getStringList('mnemonic_phrase');
    makeStringListRandom(mnemonic!);
    setState(() {
      print(mnemonic);
    });
  }

  void makeStringListRandom(List<String> stringList) {
    final random = Random();

    for (int i = stringList.length - 1; i > 0; i--) {
      final int j = random.nextInt(i + 1);
      final String temp = stringList[i];
      stringList[i] = stringList[j];
      stringList[j] = temp;
    }
    setState(() {});
  }

  clearData() {
    removedItems.clear();
  }

  checkMnemonicPhrase() async {
    final SharedPreferences prefs = await _prefs;
    var mne = prefs.getStringList('mnemonic_phrase');
    print(mne);
    bool areListsEqual = mne!.length == removedItems.length;

    if (areListsEqual) {
      for (int i = 0; i < mne.length; i++) {
        if (mne[i] != removedItems[i]) {
          areListsEqual = false;
          break;
        }
      }
    }

    if (areListsEqual) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const AccountDetails()));
    } else {
      clearStatus = true;
      setState(() {});
      final snackBar = SnackBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height - 240.h),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          content: Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12.r)),
              child: NeoSnackbar(
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/warning.svg',
                      color: Color.fromRGBO(193, 21, 52, 1),
                    ),
                    Text(
                      'Phrase is incorrect, please try again!',
                      style: GoogleFonts.urbanist(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () =>
                          ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              )));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return NeoScaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          iconTheme: const IconThemeData(color: NeoColors.soonColor),
          elevation: 0,
          centerTitle: true,
          title: Row(
            children: [
              const Spacer(),
              Text(
                'Back-up your keys',
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
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 153.h),
        child: Center(
          child: Column(
            children: [
              Text(
                'Verify your backup',
                textAlign: TextAlign.center,
                style: GoogleFonts.urbanist(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              SizedBox(height: 58.h),
              GridView.count(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                childAspectRatio: 2.8,
                mainAxisSpacing: 8.h,
                crossAxisSpacing: 8.w,
                crossAxisCount: 3,
                children: List.generate(
                    12,
                    (index) => index < removedItems.length
                        ? InkWell(
                            onTap: () => removeItem(removedItems[index]),
                            child: Container(
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
                                    text: removedItems[index],
                                    style: GoogleFonts.urbanist(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  )
                                ]),
                              ),
                            ),
                          )
                        : Opacity(
                            opacity: 0.6,
                            child: Container(
                              padding: EdgeInsets.only(left: 8.w, top: 9.h),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromRGBO(
                                        47, 145, 151, 0.1)),
                                borderRadius: BorderRadius.circular(14.r),
                                color: const Color.fromRGBO(13, 23, 22, 1),
                              ),
                              child: Text(
                                '${index + 1}',
                                style: GoogleFonts.urbanist(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: NeoColors.primaryColor),
                              ),
                            ),
                          )),
              ),
              SizedBox(
                height: 28.h,
              ),
              clearStatus == false
                  ? Text(
                      "Click the words in the correct order",
                      style: GoogleFonts.urbanist(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: NeoColors.primaryColor),
                    )
                  : InkWell(
                      onTap: () {
                        getData();
                        clearData();
                      },
                      child: Column(
                        children: [
                          Text(
                            "Clear & try again",
                            style: GoogleFonts.urbanist(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
              SizedBox(
                height: 29.h,
              ),
              SizedBox(
                height: 192.h,
                child: GridView.count(
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  childAspectRatio: 2.8,
                  mainAxisSpacing: 8.h,
                  crossAxisSpacing: 8.w,
                  crossAxisCount: 3,
                  children: List.generate(
                      mnemonic!.length,
                      (index) => InkWell(
                            onTap: () => onItemTap(mnemonic![index]),
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14.r),
                                  color: Color.fromRGBO(13, 23, 22, 1),
                                ),
                                child: Center(
                                  child: Text(
                                    mnemonic![index],
                                    style: GoogleFonts.urbanist(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                )),
                          )),
                ),
              ),
              SizedBox(height: 16.h),
              CustomButton(
                backgroundStatus: true,
                onPressed: () => checkMnemonicPhrase(),
                title: 'Verify',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
