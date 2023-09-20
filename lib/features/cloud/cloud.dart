import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonyx/features/common/neo_colors.dart';
import 'package:neonyx/features/index/first.dart';
import 'package:neonyx/features/index/second.dart';
import 'package:neonyx/features/index/third.dart';

import '../../core/get_it/configurator.dart';
import '../common/custom_nav_bar.dart';
import 'bloc/bloc/cloud_index_bloc.dart';
import 'cloud_doc.dart';
import 'cloud_files.dart';

class Cloud extends StatefulWidget {
  const Cloud({super.key});

  @override
  State<Cloud> createState() => _CloudState();
}

class _CloudState extends State<Cloud> {
  PageController controller = PageController();
  final cloudIndexNavBloc = getIt<CloudIndexBloc>();
  int currentIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
      cloudIndexNavBloc.add(CloudIndexChangedPage(index: index));
    });
  }

  @override
  void initState() {
    super.initState();
    cloudIndexNavBloc.add(CloudIndexChangedPage(index: currentIndex));
    setState(() {});
  }

  final List<NavigationBarItem> navItems = [
    NavigationBarItem(
      icon: 'assets/svg/first.svg',
    ),
    NavigationBarItem(
      icon: 'assets/svg/sec.svg',
    ),
    NavigationBarItem(
      icon: 'assets/svg/third.svg',
    ),
    NavigationBarItem(
      icon: 'assets/svg/four.svg',
    ),
    // NavigationBarItem(
    //   icon: Icons.search,
    // ),
    // NavigationBarItem(
    //   icon: Icons.favorite,
    // ),
    // NavigationBarItem(
    //   icon: Icons.person,
    // ),
  ];

  final List<Widget> screens = const [
    CloudFiles(),
    SecondScreen(),
    CloudDoc(),
    FirstScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => cloudIndexNavBloc,
        child: BlocConsumer<CloudIndexBloc, CloudIndexState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(60.h),
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 40.h, bottom: 10.h, left: 16.w, right: 10.w),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/png/cloud.png',
                              width: 28.w,
                              height: 28.h,
                            ),
                            SizedBox(
                              width: 7.h,
                            ),
                            Text(
                              'Cloud',
                              style: GoogleFonts.urbanist(
                                  color: NeoColors.primaryColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.close,
                            size: 30.h,
                            color: NeoColors.primaryColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                body: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(13, 29, 26, 1),
                        Color.fromRGBO(0, 0, 0, 1)
                      ],
                    ),
                  ),
                  child: screens[currentIndex],
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                floatingActionButton: CustomNavigationBar(
                  items: navItems,
                  currentIndex: currentIndex,
                  onTap: (value) {
                    onItemTapped(value);
                  },
                ),
              );
            }));
  }
}
