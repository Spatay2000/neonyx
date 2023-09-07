import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonyx/features/common/my_flutter_app_icons.dart';
import 'package:neonyx/features/index/first.dart';
import 'package:neonyx/features/index/second.dart';
import 'package:neonyx/features/index/third.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../core/get_it/configurator.dart';
import '../common/neo_colors.dart';
import 'bloc/bloc/index_bloc.dart';

class IndexNeo extends StatefulWidget {
  const IndexNeo({
    super.key,
    required this.screenIndex,
  });
  final int? screenIndex;

  @override
  State<IndexNeo> createState() => _IndexNeoState();
}

class _IndexNeoState extends State<IndexNeo> {
  PersistentTabController controller = PersistentTabController();
  final indexNavBloc = getIt<IndexNavBloc>();

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(MyFlutterApp.hub),
        title: "Home",
        textStyle: GoogleFonts.urbanist(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: NeoColors.navBarInActiveColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(MyFlutterApp.feed),
        title: "Search",
        textStyle: GoogleFonts.urbanist(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: NeoColors.primaryColor),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: NeoColors.navBarInActiveColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(MyFlutterApp.chat),
        title: "Home",
        textStyle: GoogleFonts.urbanist(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: NeoColors.primaryColor),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: NeoColors.navBarInActiveColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(MyFlutterApp.try5),
        title: "Home",
        textStyle: GoogleFonts.urbanist(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: NeoColors.primaryColor),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: NeoColors.navBarInActiveColor,
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    controller.index = widget.screenIndex!;
    indexNavBloc.add(IndexNavChangedPage(index: controller.index));
    log(widget.screenIndex.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => indexNavBloc,
      child: BlocConsumer<IndexNavBloc, IndexNavState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
                backgroundColor: Colors.transparent,
                body: PersistentTabView(
                  context,
                  controller: controller,
                  screens: const [
                    FirstScreen(),
                    SecondScreen(),
                    ThirdScreen(),
                    FirstScreen(),
                  ],
                  items: navBarsItems(),

                  onItemSelected: (value) {
                    indexNavBloc.add(IndexNavChangedPage(index: value));
                  },
                  navBarHeight: 80.h,
                  backgroundColor: Colors.black,
                  handleAndroidBackButtonPress: true, // Default is true.
                  resizeToAvoidBottomInset:
                      true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
                  stateManagement: false,
                  hideNavigationBar: false,
                  hideNavigationBarWhenKeyboardShows:
                      true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
                  decoration: const NavBarDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(47, 145, 151, 0.2),
                          Color.fromRGBO(121, 214, 152, 0),
                        ]),
                  ),
                  popAllScreensOnTapOfSelectedTab: true,
                  popActionScreens: PopActionScreensType.all,
                  itemAnimationProperties: const ItemAnimationProperties(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.ease,
                  ),
                  screenTransitionAnimation: const ScreenTransitionAnimation(
                    animateTabTransition: true,
                    curve: Curves.ease,
                    duration: Duration(milliseconds: 200),
                  ),
                  navBarStyle: NavBarStyle.style6,
                ));
          }),
    );
  }
}
