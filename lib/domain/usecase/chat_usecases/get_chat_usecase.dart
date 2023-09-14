import 'package:injectable/injectable.dart';
import 'package:neonyx/domain/entity/message_entity.dart';
import 'package:neonyx/domain/repository/chat_repository.dart';
import 'package:neonyx/domain/usecase/base_usecase.dart';

@lazySingleton
class GetChatUseCase extends UseCase<List<MessageEntity>, NoParams> {
  final ChatRepository repository;
  GetChatUseCase({required this.repository});

  @override
  Future<List<MessageEntity>> call(NoParams params) async =>
      await repository.getChatDetails();
}
