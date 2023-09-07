part of 'index_bloc.dart';

abstract class IndexNavState extends Equatable {
  const IndexNavState();

  @override
  List<Object> get props => [];
}

class IndexNavInitial extends IndexNavState {}

class IndexNavLoading extends IndexNavState {}

class IndexNavFailure extends IndexNavState {}

class IndexNavSuccess extends IndexNavState {}
