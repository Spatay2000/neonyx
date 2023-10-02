import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/neo_colors.dart';

class PickPhotoBottom extends StatelessWidget {
  final XFile? selectedImage;
  final Function(ImageSource) onSelectImage;

  const PickPhotoBottom(
      {super.key, required this.selectedImage, required this.onSelectImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0.h, left: 16.0.w, right: 16.0.w),
      height: 200.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0.r),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(47, 145, 151, 0.2),
            Color.fromRGBO(121, 214, 152, 0),
          ],
        ),
      ),
      child: Column(
        children: [
          Opacity(
            opacity: 0.4,
            child: Container(
              width: 60.0,
              height: 4.0,
              decoration: BoxDecoration(
                color: Color.fromRGBO(124, 167, 170, 1),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          SizedBox(height: 15.0.w),
          Container(
            width: double.infinity,
            height: 104.0.w,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.black, // Change to your desired background color
              borderRadius: BorderRadius.circular(14.0.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      onSelectImage(ImageSource
                          .camera); // Call the callback with camera source
                    },
                    child: _buildRow('Take a photo'),
                  ),
                ),
                SizedBox(height: 12.0.h),
                Opacity(
                  opacity: 0.1,
                  child: Container(
                    width: double.infinity,
                    color: const Color.fromRGBO(47, 145, 151, 1),
                    height: 1.0,
                  ),
                ),
                SizedBox(height: 12.0.h),
                Expanded(
                  child: InkWell(
                    child: _buildRow('Select from gallery'),
                    onTap: () async {
                      Navigator.pop(context);
                      onSelectImage(ImageSource
                          .gallery); // Call the callback with gallery source
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

_buildRow(String text) {
  return Row(
    children: [
      Text(
        text,
        style: GoogleFonts.urbanist(
          color: NeoColors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );
}
