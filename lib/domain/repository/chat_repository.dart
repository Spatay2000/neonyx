import 'package:neonyx/domain/entity/message_entity.dart';

abstract class ChatRepository {
  Future<List<MessageEntity>> getChatDetails();
  Future<void> sendMessage(MessageEntity message);
  Future<void> sendAudio(MessageEntity audio);
  Future<void> sendImage(MessageEntity image);
}
