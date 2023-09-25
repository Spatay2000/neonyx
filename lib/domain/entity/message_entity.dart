import 'package:photo_manager/photo_manager.dart';

class MessageEntity {
  final int? id;
  final String? icon;
  final int? from;
  final String? message;
  final String? audioPath;
  final DateTime? createdAt;
  final List<String>? imagesPath;
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
    this.imagesPath,
  });

  MessageEntity copyWith({
    int? id,
    int? from,
    String? message,
    String? audioPath,
    DateTime? createdAt,
    List<AssetEntity>? assetEntity,
    List<String>? imagesPath,
  }) =>
      MessageEntity(
        id: id ?? this.id,
        from: from ?? this.from,
        message: message ?? this.message,
        audioPath: audioPath ?? this.audioPath,
        createdAt: createdAt ?? this.createdAt,
        imagesPath: imagesPath ?? this.imagesPath,
      );
}
