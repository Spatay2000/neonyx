import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:neonyx/core/constants/hive_box_names.dart';
import 'package:neonyx/data/model/message_model.dart';
import 'package:neonyx/domain/entity/message_entity.dart';

abstract class ChatLocalDataSource {
  Future<List<MessageEntity>> getChat();
  Future<void> saveMessage(MessageEntity message);
  Future<void> saveAudio(MessageEntity audio);
  Future<void> saveChat(List<MessageEntity> chat);
  Future<void> saveImage(MessageEntity image);
}

@LazySingleton(as: ChatLocalDataSource)
class ChatLocalDataSourceImpl implements ChatLocalDataSource {
  @override
  Future<List<MessageEntity>> getChat() async {
    final box = await _checkIsBoxOpen<MessageModel>(NeoHiveBoxNames.chat);
    return List<MessageEntity>.from(box.values.map((e) => e.toEntity()));
  }

  @override
  Future<void> saveChat(List<MessageEntity> chat) async {
    final box = await _checkIsBoxOpen<MessageModel>(NeoHiveBoxNames.chat);
    await box.clear();
    await box.addAll(
      List<MessageModel>.from(
        chat.map(
          (e) => MessageModel.fromEntity(e),
        ),
      ),
    );
  }

  @override
  Future<void> saveMessage(MessageEntity message) async {
    final box = await _checkIsBoxOpen<MessageModel>(NeoHiveBoxNames.chat);
    if (message.id == null) {
      await box.add(MessageModel.fromEntity(message));
      log("SAVED MESSAGE");
    } else {
      await box.put(message.id, MessageModel.fromEntity(message));
    }
  }

  @override
  Future<void> saveAudio(MessageEntity audio) async {
    final box = await _checkIsBoxOpen<MessageModel>(NeoHiveBoxNames.chat);
    if (audio.id == null) {
      await box.add(MessageModel.fromEntity(audio));
      log("SAVED AUDIO");
    } else {
      await box.put(audio.id, MessageModel.fromEntity(audio));
    }
  }

  @override
  Future<void> saveImage(MessageEntity image) async {
    final box = await _checkIsBoxOpen<MessageModel>(NeoHiveBoxNames.chat);
    if (image.id == null) {
      await box.add(MessageModel.fromEntity(image));
      log("SAVED IMAGE");
    } else {
      await box.put(image.id, MessageModel.fromEntity(image));
      log("SAVED IMAGE (ELSE)");
    }
  }

  Future<Box<T>> _checkIsBoxOpen<T>(String name) async {
    final box =
        Hive.isBoxOpen(name) ? Hive.box<T>(name) : await Hive.openBox<T>(name);
    return box;
  }
}
