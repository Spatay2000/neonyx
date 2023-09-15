// temp entity
class ChatEntity {
  final int? id;
  final bool? isGroupChat;
  final String? avatar;
  final String? groupAva;
  final String? groupName;
  final String? userName;
  final String? lastMessage;
  final String? lastMessageTime;
  final bool? isPinned;

  const ChatEntity({
    this.id,
    this.isGroupChat,
    this.avatar,
    this.groupAva,
    this.groupName,
    this.userName,
    this.lastMessage,
    this.lastMessageTime,
    this.isPinned,
  });
}
