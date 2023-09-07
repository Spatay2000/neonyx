class TopicEntity {
  final int id;
  final String topic;
  final bool isChoosed;
  TopicEntity({
    required this.id,
    required this.topic,
    required this.isChoosed,
  });

  TopicEntity copyWith({
    int? id,
    String? topic,
    bool? isChoosed,
  }) =>
      TopicEntity(
        id: id ?? this.id,
        topic: topic ?? this.topic,
        isChoosed: isChoosed ?? this.isChoosed,
      );
}
