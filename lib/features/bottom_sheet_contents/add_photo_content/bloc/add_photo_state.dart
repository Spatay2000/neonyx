
import 'package:equatable/equatable.dart';

abstract class AddPhotoState extends Equatable {
  const AddPhotoState();

  @override
  List<Object> get props => [];
}

class AddPhotoIndexInitial extends AddPhotoState {}

class AddPhotoIndexLoading extends AddPhotoState {}

class AddPhotoIndexFailure extends AddPhotoState {}

class AddPhotoIndexSuccess extends AddPhotoState {}
