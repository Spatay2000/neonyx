import 'package:injectable/injectable.dart';
import 'package:neonyx/domain/entity/message_entity.dart';
import 'package:neonyx/domain/repository/chat_repository.dart';
import 'package:neonyx/domain/usecase/base_usecase.dart';

@lazySingleton
class SendImageUseCase extends UseCase<void, SendImageUseCaseParams> {
  final ChatRepository repository;
  SendImageUseCase({required this.repository});

  @override
  Future<void> call(SendImageUseCaseParams params) async =>
      await repository.sendMessage(params.image);
}

class SendImageUseCaseParams {
  final MessageEntity image;
  SendImageUseCaseParams(this.image);
}
