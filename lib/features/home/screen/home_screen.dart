import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonyx/features/common/custom_tab_bar.dart';

import 'package:neonyx/features/common/neo_scaffold.dart';
import 'package:neonyx/features/home/widget/my_apps_widget.dart';

import '../widget/popular_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController? _tabController;
  List<String> data = [
    'My apps',
    'Popular',
    'Neonyx',
    'My apps',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: data.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: data.length,
      child: NeoScaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                      left: 18.0, right: 18, top: 65, bottom: 25)
                  .r,
              child: Row(
                children: [
                  Text(
                    'App hub',
                    style: GoogleFonts.urbanist(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  SvgPicture.asset('assets/svg/search.svg')
                ],
              ),
            ),
            CustomTabBar(
              tabs: data,
              controller: _tabController,
              padding: EdgeInsets.only(left: 16.0.w, right: 16.w),
              secondText: false,
            ),
            Expanded(
              child: TabBarView(
                physics: const BouncingScrollPhysics(),
                controller: _tabController,
                children: const [
                  MyAppsWidget(),
                  PopularWidget(),
                  MyAppsWidget(),
                  MyAppsWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
