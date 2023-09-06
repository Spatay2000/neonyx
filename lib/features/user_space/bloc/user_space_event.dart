import 'package:equatable/equatable.dart';

abstract class UserSpaceEvent extends Equatable {
  const UserSpaceEvent();

  @override
  List<Object> get props => [];
}

class LoadTopics extends UserSpaceEvent {}

class AddTopic extends UserSpaceEvent {
  final int id;
  const AddTopic({required this.id});

  @override
  List<Object> get props => [id];
}

class DeleteTopic extends UserSpaceEvent {}
