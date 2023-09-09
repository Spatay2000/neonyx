class FeedEntity {
  final int id;
  final String avatar;
  final String? storyImage;
  final String? groupAva;
  final String username;
  final int postTime;
  final int commentTotal;
  final int likeTotal;
  final int shareTotal;

  FeedEntity(
      {required this.id,
      this.groupAva,
      this.storyImage,
      required this.avatar,
      required this.username,
      required this.postTime,
      required this.commentTotal,
      required this.likeTotal,
      required this.shareTotal});
}
