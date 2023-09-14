import 'package:injectable/injectable.dart';
import 'package:neonyx/domain/entity/message_entity.dart';
import 'package:neonyx/domain/repository/chat_repository.dart';
import 'package:neonyx/domain/usecase/base_usecase.dart';

@lazySingleton
class SendAudioUseCase extends UseCase<void, SendAudioUseCaseParams> {
  final ChatRepository repository;
  SendAudioUseCase({required this.repository});

  @override
  Future<void> call(SendAudioUseCaseParams params) async =>
      await repository.sendAudio(params.audio);
}

class SendAudioUseCaseParams {
  final MessageEntity audio;
  SendAudioUseCaseParams(this.audio);
}
