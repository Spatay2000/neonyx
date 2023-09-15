import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neonyx/features/common/app_bar_in_navbar.dart';
import 'package:neonyx/features/common/neo_scaffold.dart';
import 'package:neonyx/features/feed/widget/feed_list.dart';

import '../common/custom_tab_bar.dart';
import 'widget/feed_show_modal_widget.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> with TickerProviderStateMixin {
  TabController? tabController;
  List<String>? data = ['For you', 'Following'];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: data!.length, vsync: this);
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: data!.length,
      child: NeoScaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarInNavBar(
              title: 'Feed',
              actions: InkWell(
                onTap: () => showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    useRootNavigator: true,
                    isDismissible: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    builder: (context) {
                      return const FeedShowModalWidget();
                    }),
                child: Image.asset(
                  'assets/png/primary_icon.png',
                  width: 36.w,
                  height: 36.w,
                ),
              ),
              iconNearTitle: SvgPicture.asset('assets/svg/story.svg'),
            ),
            CustomTabBar(
              secondText: true,
              
              tabs: data!,
             
              controller: tabController,
              padding: EdgeInsets.only(left: 16.0.w, right: 16.w),
            
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: [
                  FeedListWidget(),
                  FeedListWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PostImage extends StatelessWidget {
  const PostImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
