import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:equatable/equatable.dart';

part 'index_event.dart';
part 'index_state.dart';

@injectable
class IndexNavBloc extends Bloc<IndexNavEvent, IndexNavState> {
  IndexNavBloc() : super(IndexNavInitial()) {
    on<IndexNavStarted>((event, emit) {
      emit(IndexNavLoading());
    });
    on<IndexNavChangedPage>((event, emit) async {
      emit(IndexNavLoading());
      emit(IndexNavSuccess());
    });
  }
}
