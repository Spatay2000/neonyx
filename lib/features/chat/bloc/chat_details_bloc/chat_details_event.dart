import 'package:equatable/equatable.dart';

abstract class ChatDetailsEvent extends Equatable {
  const ChatDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadChat extends ChatDetailsEvent {}

class SendMessage extends ChatDetailsEvent {
  final String message;
  const SendMessage({required this.message});

  @override
  List<Object> get props => [message];
}

class SendAudio extends ChatDetailsEvent {
  final String audioPath;
  const SendAudio({required this.audioPath});

  @override
  List<Object> get props => [audioPath];
}

class SendPhoto extends ChatDetailsEvent {
  final List<String> imagesPath;
  final String message;
  const SendPhoto({
    required this.imagesPath,
    required this.message,
  });

  @override
  List<Object> get props => [
        imagesPath,
        message,
      ];
}
