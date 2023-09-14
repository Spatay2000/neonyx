import 'package:injectable/injectable.dart';
import 'package:neonyx/domain/entity/message_entity.dart';
import 'package:neonyx/domain/repository/chat_repository.dart';
import 'package:neonyx/domain/usecase/base_usecase.dart';

@lazySingleton
class SendMessageUseCase extends UseCase<void, SendMessageUseCaseParams> {
  final ChatRepository repository;
  SendMessageUseCase({required this.repository});

  @override
  Future<void> call(SendMessageUseCaseParams params) async =>
      await repository.sendMessage(params.message);
}

class SendMessageUseCaseParams {
  final MessageEntity message;
  SendMessageUseCaseParams(this.message);
}
