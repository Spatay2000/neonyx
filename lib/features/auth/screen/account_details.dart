import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neonyx/features/auth/screen/claim_username.dart';
import 'package:neonyx/features/auth/widget/pick_photo_bottom.dart';
import 'package:neonyx/features/common/neo_colors.dart';
import 'package:neonyx/features/common/neo_scaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/neo_button.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails({super.key});

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  TextEditingController usernameController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool isButtonEnabled = false;
  XFile? image;
  File? imageAva;

  @override
  void initState() {
    super.initState();
    usernameController.addListener(_updateButtonState);
  }

  void selectImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        setState(() {
          image = pickedImage;
          imageAva = File(pickedImage.path);
        });
      }
    } catch (e) {
      // Handle any exceptions that might occur when selecting an image.
      print("Error selecting image: $e");
    }
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
        MaterialPageRoute(builder: (context) => const ClaimUsername()));
  }

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NeoScaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(top: 70.h),
        child: Column(
          children: [
            Center(
              child: Text(
                'Set up your account:',
                style: GoogleFonts.urbanist(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Center(
              child: Text(
                '0xD15122E5909833a25b561Bf1ED88150D0f2434ba',
                style: GoogleFonts.urbanist(
                    color: NeoColors.primaryColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 26.h,
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 210.h, left: 16.w, right: 16.w),
                  padding:
                      EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
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
                Positioned(
                  right: 45.w,
                  child: Opacity(
                    opacity: 0.20,
                    child: Container(
                      width: 256.w,
                      height: 256.h,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          // color: Colors.transparent,
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromRGBO(47, 145, 151, 0.4),
                                Color.fromRGBO(47, 145, 151, 0)
                              ]),
                          border: GradientBoxBorder(
                              width: 2,
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromRGBO(47, 145, 151, 0.4),
                                    Color.fromRGBO(47, 145, 151, 0),
                                  ]))),
                    ),
                  ),
                ),
                Positioned(
                  right: 94.w,
                  top: 33.h,
                  child: InkWell(
                    onTap: () async => showModalBottomSheet(
                        backgroundColor: const Color(0xFF090F0B),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topRight: Radius.circular(24.r),
                          topLeft: Radius.circular(24.r),
                        )),
                        context: context,
                        builder: (context) {
                          return PickPhotoBottom(
                            selectedImage: image,
                            onSelectImage: selectImage,
                          );
                        }),
                    child: Container(
                      width: 56.w,
                      height: 56.h,
                      padding: const EdgeInsets.all(14).r,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(colors: [
                            Color.fromRGBO(47, 145, 151, 0.2),
                            Color.fromRGBO(47, 145, 151, 0)
                          ]),
                          border: Border.all(
                            width: 2,
                            color: const Color.fromRGBO(47, 145, 151, 0.4),
                          )),
                      child: SvgPicture.asset(
                        'assets/svg/camera.svg',
                        width: 28.w,
                        height: 28.h,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 104.w,
                  top: 58.h,
                  child: GestureDetector(
                    onTap: () async => showModalBottomSheet(
                        backgroundColor: const Color(0xFF090F0B),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topRight: Radius.circular(24.r),
                          topLeft: Radius.circular(24.r),
                        )),
                        context: context,
                        builder: (context) {
                          return PickPhotoBottom(
                            selectedImage: image,
                            onSelectImage: selectImage,
                          );
                        }),
                    child: Container(
                      width: 140.w,
                      height: 140.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 5,
                            color: const Color.fromRGBO(47, 145, 151, 1),
                          )),
                      child: ClipOval(
                        child: imageAva != null
                            ? Image.file(
                                imageAva!,
                                fit: BoxFit.cover,
                              )
                            : Image.asset('assets/png/default.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 17.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Opacity(
                opacity: isButtonEnabled == true ? 1 : 0.3,
                child: CustomButton(
                  onPressed: () =>
                      isButtonEnabled == true ? saveUsername() : null,
                  backgroundStatus: false,
                  title: 'Save changes',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
