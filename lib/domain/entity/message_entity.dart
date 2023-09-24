import 'package:photo_manager/photo_manager.dart';

class MessageEntity {
  final int? id;
  final String? icon;
  final int? from;
  final String? message;
  final String? audioPath;
  final DateTime? createdAt;
  final List<AssetEntity>? assetEntity;
  // temporary field
  final String? name;
  // temporary field
  final bool isChatMan;

  const MessageEntity({
    this.id,
    this.icon,
    this.from,
    this.message,
    this.audioPath,
    this.createdAt,
    this.name,
    this.isChatMan = false,
    this.assetEntity,
  });

  MessageEntity copyWith({
    int? id,
    int? from,
    String? message,
    String? audioPath,
    DateTime? createdAt,
    List<AssetEntity>? assetEntity,
  }) =>
      MessageEntity(
        id: id ?? this.id,
        from: from ?? this.from,
        message: message ?? this.message,
        audioPath: audioPath ?? this.audioPath,
        createdAt: createdAt ?? this.createdAt,
        assetEntity: assetEntity ?? this.assetEntity,
      );
}
