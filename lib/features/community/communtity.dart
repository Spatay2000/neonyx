import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonyx/features/common/neo_scaffold.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../common/custom_tab_bar.dart';
import '../common/neo_colors.dart';
import 'community_details.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> with TickerProviderStateMixin {
  TabController? _tabController;
  List<String> data = [
    'All communities 72',
    'Member 34',
    'Following 2',
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
    return NeoScaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                    left: 18.0, right: 18, top: 65, bottom: 25)
                .r,
            child: Row(
              children: [
                Text(
                  'Community',
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
          Divider(
            color: NeoColors.soonColor.withOpacity(0.1),
            thickness: 1.0,
          ),
          Expanded(
            child: TabBarView(
              physics: const BouncingScrollPhysics(),
              controller: _tabController,
              children: const [
                ListCommunity(),
                ListCommunity(),
                ListCommunity(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListCommunity extends StatefulWidget {
  const ListCommunity({super.key});

  @override
  State<ListCommunity> createState() => _ListCommunityState();
}

class _ListCommunityState extends State<ListCommunity> {
  List<CommunityModel> listCommunity = const [
    CommunityModel(name: 'Go_Dev', title: null),
    CommunityModel(name: 'Go_Dev', title: 'GoLang for everyone')
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: listCommunity.length,
      separatorBuilder: ((context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Divider(
            color: NeoColors.soonColor.withOpacity(0.1),
            thickness: 1.0,
          ),
        );
      }),
      itemBuilder: (context, index) => InkWell(
        onTap: () => pushNewScreen(context,
            screen: const CommunityDetails(), withNavBar: false),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Row(
            children: [
              Image.asset(
                'assets/png/community.png',
                width: 44.w,
                height: 44.h,
              ),
              SizedBox(
                width: 20.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listCommunity[index].name,
                    style: GoogleFonts.urbanist(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  listCommunity[index].title != null
                      ? SizedBox(
                          height: 4.h,
                        )
                      : const SizedBox(),
                  listCommunity[index].title != null
                      ? Text(
                          listCommunity[index].title!,
                          style: GoogleFonts.urbanist(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: NeoColors.primaryColor),
                        )
                      : const SizedBox(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CommunityModel {
  final String name;
  final String? title;

  const CommunityModel({required this.name, required this.title});
}
