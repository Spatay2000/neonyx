part of 'cloud_index_bloc.dart';

abstract class CloudIndexState extends Equatable {
  const CloudIndexState();

  @override
  List<Object> get props => [];
}

class CloudIndexInitial extends CloudIndexState {}

class CloudIndexLoading extends CloudIndexState {}

class CloudIndexFailure extends CloudIndexState {}

class CloudIndexSuccess extends CloudIndexState {}
