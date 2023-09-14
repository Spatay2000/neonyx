import 'package:equatable/equatable.dart';
import 'package:neonyx/domain/entity/message_entity.dart';

abstract class ChatDetailsState extends Equatable {
  const ChatDetailsState();

  @override
  List<Object> get props => [];
}

class ChatLoading extends ChatDetailsState {}

class ChatLoaded extends ChatDetailsState {
  final List<MessageEntity> chat;

  const ChatLoaded({
    required this.chat,
  });

  @override
  List<Object> get props => [chat];
}
