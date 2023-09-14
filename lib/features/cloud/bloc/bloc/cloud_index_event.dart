part of 'cloud_index_bloc.dart';

abstract class Cloud_IndexEvent extends Equatable {
  const Cloud_IndexEvent();

  @override
  List<Object> get props => [];
}

class CloudIndexStarted extends Cloud_IndexEvent {}

class CloudIndexGoAppBar extends Cloud_IndexEvent {}

class CloudIndexChangedPage extends Cloud_IndexEvent {
  final int index;

  const CloudIndexChangedPage({required this.index});

  @override
  List<Object> get props => [index];
}
