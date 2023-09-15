import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:equatable/equatable.dart';

part 'cloud_index_event.dart';
part 'cloud_index_state.dart';

@injectable
class CloudIndexBloc extends Bloc<Cloud_IndexEvent, CloudIndexState> {
  CloudIndexBloc() : super(CloudIndexInitial()) {
    on<CloudIndexStarted>((event, emit) {
      emit(CloudIndexLoading());
    });
    on<CloudIndexChangedPage>((event, emit) async {
      emit(CloudIndexLoading());
      emit(CloudIndexSuccess());
    });
  }
}
