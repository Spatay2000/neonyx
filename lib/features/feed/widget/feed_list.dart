import 'package:flutter/material.dart';
import 'package:neonyx/domain/entity/feed_entity.dart';
import 'package:neonyx/features/feed/widget/feed_strory.dart';
import 'package:neonyx/features/feed/widget/post_widget.dart';


class FeedListWidget extends StatefulWidget {
  const FeedListWidget({super.key});

  @override
  State<FeedListWidget> createState() => _FeedListWidgetState();
}

class _FeedListWidgetState extends State<FeedListWidget> {
  List<FeedEntity> feedList = [
    FeedEntity(
        id: 1,
        avatar: "assets/png/Avatar_group.png",
        groupAva: 'assets/png/group_ava.png',
        username: 'MemeStream',
        storyImage: 'assets/png/story.png',
        postTime: 8,
        commentTotal: 10,
        likeTotal: 15,
        shareTotal: 12),
    FeedEntity(
        id: 2,
        avatar: "assets/png/avatar_2_4x_icon.png",
        storyImage: 'assets/png/story.png',
        username: 'Team General Chat',
        postTime: 8,
        commentTotal: 10,
        likeTotal: 15,
        shareTotal: 12),
    FeedEntity(
        id: 3,
        avatar: "assets/png/avatar_3_4x_icon.png",
        username: 'Go dev',
        postTime: 8,
        commentTotal: 10,
        likeTotal: 15,
        shareTotal: 12),
    FeedEntity(
        id: 4,
        avatar: "assets/png/avatar_4_4x_icon.png",
        username: 'MemeStream',
        postTime: 8,
        commentTotal: 10,
        likeTotal: 15,
        shareTotal: 12),
    FeedEntity(
        id: 5,
        avatar: "assets/png/avatar_1_4x_icon.png",
        username: 'Team General Chat',
        postTime: 8,
        commentTotal: 10,
        likeTotal: 15,
        shareTotal: 12),
    FeedEntity(
        id: 6,
        avatar: "assets/png/avatar_2_4x_icon.png",
        username: 'Go dev',
        postTime: 8,
        commentTotal: 10,
        likeTotal: 15,
        shareTotal: 12),
    FeedEntity(
        id: 7,
        avatar: "assets/png/avatar_3_4x_icon.png",
        username: 'Team General Chat',
        postTime: 8,
        commentTotal: 10,
        likeTotal: 15,
        shareTotal: 12),
    FeedEntity(
        id: 8,
        avatar: "assets/png/avatar_4_4x_icon.png",
        username: 'Go dev',
        postTime: 8,
        commentTotal: 10,
        likeTotal: 15,
        shareTotal: 12),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FeedStoryWidget(
          feedStory: feedList,
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return const PostWidget();
            },
          ),
        ),
      ],
    );
  }
}
