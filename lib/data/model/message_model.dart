import 'package:hive_flutter/hive_flutter.dart';
import 'package:neonyx/domain/entity/message_entity.dart';

part 'message_model.g.dart';

@HiveType(typeId: 0)
class MessageModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  int? from;
  @HiveField(2)
  String? message;
  @HiveField(3)
  DateTime? createdAt;
  @HiveField(4)
  String? audioPath;

  MessageModel({
    this.id,
    this.from,
    this.message,
    this.createdAt,
    this.audioPath,
  });

  factory MessageModel.fromEntity(MessageEntity entity) => MessageModel(
        id: entity.id,
        from: entity.from,
        message: entity.message,
        createdAt: entity.createdAt,
        audioPath: entity.audioPath,
      );

  MessageEntity toEntity() => MessageEntity(
        id: id,
        message: message,
        from: from,
        createdAt: createdAt,
        audioPath: audioPath,
      );
}
