part of 'index_bloc.dart';

abstract class IndexNavEvent extends Equatable {
  const IndexNavEvent();

  @override
  List<Object> get props => [];
}

class IndexNavStarted extends IndexNavEvent {}

class IndexNavGoAppBar extends IndexNavEvent {}

class IndexNavChangedPage extends IndexNavEvent {
  final int index;

  const IndexNavChangedPage({required this.index});

  @override
  List<Object> get props => [index];
}
