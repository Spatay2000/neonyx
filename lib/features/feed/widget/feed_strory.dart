import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neonyx/domain/entity/feed_entity.dart';
import 'package:neonyx/features/feed/widget/story.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../common/neo_colors.dart';

class FeedStoryWidget extends StatelessWidget {
  final List<FeedEntity>? feedStory;
  const FeedStoryWidget({
    super.key,
    this.feedStory,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
          child: Divider(
            color: NeoColors.soonColor.withOpacity(0.1),
            thickness: 1.0,
          ),
        ),
        SizedBox(
          height: 44.h,
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 16.w),
            scrollDirection: Axis.horizontal,
            itemCount: feedStory!.length,
            itemBuilder: (context, index) => feedStory![index].groupAva != null
                ? InkWell(
                    onTap: () => feedStory![index].storyImage != null
                        ? pushNewScreen(
                            context,
                            screen: StoryWidget(
                              feedEntity: feedStory!,
                            ),
                            withNavBar: false,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          )
                        : null,
                    child: Opacity(
                      opacity: feedStory![index].storyImage != null ? 1 : 0.2,
                      child: Stack(
                        // alignment: Alignment.topLeft,
                        children: [
                          ClipOval(
                            child: Container(
                              color: NeoColors.grayColor,
                              child: Image.asset(
                                feedStory![index].groupAva!,
                                width: 20.w,
                                height: 20.h,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Positioned(
                            // right: 0.w,
                            child: Padding(
                              padding: EdgeInsets.only(top: 4, left: 4),
                              child: ClipOval(
                                child: Container(
                                  color: NeoColors.grayColor,
                                  child: Image.asset(
                                    feedStory![index].avatar,
                                    width: 40.w,
                                    height: 40.h,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : InkWell(
                    onTap: () => feedStory![index].storyImage != null
                        ? pushNewScreen(
                            context,
                            screen: StoryWidget(
                              feedEntity: feedStory!,
                            ),
                            withNavBar: false,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          )
                        : null,
                    child: Opacity(
                      opacity: feedStory![index].storyImage != null ? 1 : 0.2,
                      child: ClipOval(
                        child: Container(
                          color: NeoColors.grayColor,
                          child: Image.asset(
                            feedStory![index].avatar,
                            width: 44.w,
                            height: 44.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
            separatorBuilder: (context, index) => SizedBox(
              width: 12.w,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
          child: Divider(
            color: NeoColors.soonColor.withOpacity(0.1),
            thickness: 1.0,
          ),
        ),
      ],
    );
  }
}
