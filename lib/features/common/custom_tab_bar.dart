import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'neo_colors.dart';

class CustomTabBar extends StatefulWidget {
  final List<String>? tabs;
  final TabController? controller;

  const CustomTabBar({super.key, required this.tabs, required this.controller});

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int _currentIndex = 0; // Текущий выбранный индекс

  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(() {
      setState(() {
        _currentIndex = widget.controller!.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0.w, right: 16.w),
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            onTap: (int index) {},
            controller: widget.controller,
            indicatorColor: Colors.transparent,
            indicator: const UnderlineTabIndicator(borderSide: BorderSide.none),
            labelPadding: EdgeInsets.zero,
            tabs: [
              for (int i = 0; i < widget.tabs!.length; i++)
                Padding(
                  padding: EdgeInsets.only(right: 8.0.w),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: ShapeDecoration(
                      color: i != _currentIndex
                          ? Colors
                              .transparent // Измените цвет для активной вкладки
                          : const Color(0x192F9096),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Color(0x182F9197)),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.tabs![i],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.40.h,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Opacity(
                          opacity: 0.40,
                          child: Text(
                            '2',
                            style: TextStyle(
                              color: NeoColors.primaryColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              height: 1.40.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }
}
