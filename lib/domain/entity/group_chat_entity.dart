import 'package:neonyx/domain/entity/user_entity.dart';

class GroupChatEntity {
  final int? id;
  final String? name;
  final List<UserEntity>? users;

  const GroupChatEntity({
    this.id,
    this.name,
    this.users,
  });
}
