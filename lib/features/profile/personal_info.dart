import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonyx/features/common/neo_scaffold.dart';
import 'package:neonyx/features/common/neo_second_input_field.dart';
import 'package:photo_manager/photo_manager.dart';

import '../bottom_sheet_contents/add_photo_content/add_photo_content.dart';
import '../common/neo_colors.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  TextEditingController controller =
      TextEditingController(text: 'SatoshiSeeker');
  TextEditingController userController =
      TextEditingController(text: 'congratulation');
  TextEditingController bioController =
      TextEditingController(text: 'Golang for everyone');
  TextEditingController linkController =
      TextEditingController(text: 'https://bitcoin.org/');

  @override
  Widget build(BuildContext context) {
    return NeoScaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.h),
        child: Container(
          padding:
              EdgeInsets.only(top: 50.h, bottom: 10.h, left: 16.w, right: 10.w),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(0, 0, 0, 1),
                Color.fromRGBO(19, 44, 39, 1),
              ],
            ),
          ),
          child: Row(
            children: [
              const BackButton(
                color: NeoColors.soonColor,
              ),
              const Spacer(
                flex: 4,
              ),
              Text(
                'Personal Info',
                style: GoogleFonts.urbanist(
                    color: NeoColors.primaryColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400),
              ),
              const Spacer(
                flex: 6,
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 222.h,
                width: double.maxFinite,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    'assets/png/fon2.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 30.h,
                right: 27.5.w,
                child: GestureDetector(
                  onTap: () => showModalBottomSheet(
                    context: context,
                    isDismissible: true,
                    isScrollControlled: true,
                    backgroundColor: Colors.black,
                    builder: (context) => const AddPhotoContent(
                      10,
                      RequestType.image,
                    ),
                  ),
                  child: SvgPicture.asset(
                    'assets/svg/edit.svg',
                    width: 28.w,
                    height: 28.h,
                  ),
                ),
              ),
              Positioned(
                top: 51.h,
                left: 138.w,
                right: 138.w,
                child: Container(
                  width: 84.w,
                  height: 84.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/png/avatar_1_4x_icon.png"),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                          width: 84.w,
                          height: 84.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: NeoColors.navBarInActiveColor.withOpacity(
                                0.6), // Adjust opacity and color as needed
                          ),
                        ),
                      ),
                      Center(
                        child: SvgPicture.asset(
                          'assets/svg/edit.svg',
                          width: 28.w,
                          height: 28.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 5.h,
                right: 16.w,
                left: 16.w,
                child: NeoSecondInputField(
                    controller: controller,
                    hintText: 'SatoshiSeeker',
                    title: 'Public name'),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                NeoSecondInputField(
                    controller: userController,
                    hintText: '',
                    prefix: true,
                    suffix: true,
                    title: 'Username'),
                SizedBox(
                  height: 20.h,
                ),
                NeoSecondInputField(
                    controller: bioController, hintText: '', title: 'Bio'),
                SizedBox(
                  height: 20.h,
                ),
                NeoSecondInputField(
                    controller: linkController,
                    hintText: 'SatoshiSeeker',
                    title: 'Web link'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
