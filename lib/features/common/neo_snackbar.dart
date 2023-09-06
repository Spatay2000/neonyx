import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class NeoSnackbar extends StatelessWidget {
  final Widget widget;
  const NeoSnackbar({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(193, 21, 52, 0.2),
                  Color.fromRGBO(193, 21, 52, 0.1),
                ]),
            borderRadius: BorderRadius.circular(14.0.r),
            border: const GradientBoxBorder(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color.fromRGBO(193, 21, 52, 0.4),
                  Color.fromRGBO(193, 21, 52, 0),
                ]))),
        child: widget);
  }
}
