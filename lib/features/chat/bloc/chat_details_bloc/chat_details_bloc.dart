import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:neonyx/domain/entity/message_entity.dart';
import 'package:neonyx/domain/usecase/base_usecase.dart';
import 'package:neonyx/domain/usecase/chat_usecases/get_chat_usecase.dart';
import 'package:neonyx/domain/usecase/chat_usecases/send_audio_usecase.dart';
import 'package:neonyx/domain/usecase/chat_usecases/send_message_usecase.dart';
import 'package:neonyx/features/chat/bloc/chat_details_bloc/chat_details_event.dart';
import 'package:neonyx/features/chat/bloc/chat_details_bloc/chat_details_state.dart';

@injectable
class ChatDetailsBloc extends Bloc<ChatDetailsEvent, ChatDetailsState> {
  final GetChatUseCase getChatUseCase;
  final SendMessageUseCase sendMessageUseCase;
  final SendAudioUseCase sendAudioUseCase;
  ChatDetailsBloc({
    required this.getChatUseCase,
    required this.sendMessageUseCase,
    required this.sendAudioUseCase,
  }) : super(ChatLoading()) {
    on<LoadChat>(
      (event, emit) async {
        final chat = await getChatUseCase.call(NoParams());

        chat.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));

        emit(ChatLoaded(chat: chat));
      },
    );

    on<SendMessage>((event, emit) async {
      await sendMessageUseCase.call(
        SendMessageUseCaseParams(
          MessageEntity(
            message: event.message,
            createdAt: DateTime.now(),
          ),
        ),
      );
      add(LoadChat());
    });

    on<SendAudio>(
      (event, emit) async {
        await sendAudioUseCase.call(
          SendAudioUseCaseParams(
            MessageEntity(
              audioPath: event.audioPath,
              createdAt: DateTime.now(),
            ),
          ),
        );
        add(LoadChat());
      },
    );
  }
}
