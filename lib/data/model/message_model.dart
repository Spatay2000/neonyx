import 'package:hive_flutter/hive_flutter.dart';
import 'package:neonyx/domain/entity/message_entity.dart';
import 'package:photo_manager/photo_manager.dart';

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
  @HiveField(5)
  List<AssetEntity>? assetEntity;

  MessageModel({
    this.id,
    this.from,
    this.message,
    this.createdAt,
    this.audioPath,
    this.assetEntity,
  });

  factory MessageModel.fromEntity(MessageEntity entity) => MessageModel(
        id: entity.id,
        from: entity.from,
        message: entity.message,
        createdAt: entity.createdAt,
        audioPath: entity.audioPath,
        assetEntity: entity.assetEntity,
      );

  MessageEntity toEntity() => MessageEntity(
        id: id,
        message: message,
        from: from,
        createdAt: createdAt,
        audioPath: audioPath,
        assetEntity: assetEntity,
      );
}
