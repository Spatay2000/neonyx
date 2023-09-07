import 'package:equatable/equatable.dart';
import 'package:neonyx/domain/entity/topic_entity.dart';

abstract class UserSpaceState extends Equatable {
  const UserSpaceState();

  @override
  List<Object> get props => [];
}

class TopicLoading extends UserSpaceState {}

class TopicsLoaded extends UserSpaceState {
  final List<List<TopicEntity>> topics;
  const TopicsLoaded({required this.topics});

  @override
  List<Object> get props => [topics];
}
