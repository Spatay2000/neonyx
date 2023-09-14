import 'package:injectable/injectable.dart';
import 'package:neonyx/data/datasource/local/chat_local_datasource.dart';
import 'package:neonyx/domain/entity/message_entity.dart';
import 'package:neonyx/domain/repository/chat_repository.dart';

@LazySingleton(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  final ChatLocalDataSource localDataSource;

  ChatRepositoryImpl({required this.localDataSource});
  @override
  Future<List<MessageEntity>> getChatDetails() async {
    List<MessageEntity> chat;
    chat = await localDataSource.getChat();
    if (chat.isEmpty) {
      // add remotely chat
      await localDataSource.saveChat(chat);
    }
    return chat;
  }

  @override
  Future<void> sendMessage(MessageEntity message) async {
    await localDataSource.saveMessage(message);
  }

  @override
  Future<void> sendAudio(MessageEntity audio) async {
    await localDataSource.saveAudio(audio);
  }
}
