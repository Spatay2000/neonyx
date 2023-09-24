
import 'package:equatable/equatable.dart';

abstract class AddPhotoEvent extends Equatable {
  const AddPhotoEvent();

  @override
  List<Object> get props => [];
}

class AddPhotoIndexStarted extends AddPhotoEvent {}

class AddPhotoIndexChangedPage extends AddPhotoEvent {
  final int index;

  const AddPhotoIndexChangedPage({required this.index});

  @override
  List<Object> get props => [index];
}
