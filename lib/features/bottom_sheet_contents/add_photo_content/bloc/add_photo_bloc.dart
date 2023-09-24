import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:neonyx/features/bottom_sheet_contents/add_photo_content/bloc/add_photo_event.dart';
import 'package:neonyx/features/bottom_sheet_contents/add_photo_content/bloc/add_photo_state.dart';

@injectable
class AddPhotoBloc extends Bloc<AddPhotoEvent, AddPhotoState> {
  AddPhotoBloc() : super(AddPhotoIndexInitial()) {
    on<AddPhotoIndexStarted>((event, emit) {
      emit(AddPhotoIndexLoading());
    });
    on<AddPhotoIndexChangedPage>((event, emit) async {
      emit(AddPhotoIndexLoading());
      emit(AddPhotoIndexSuccess());
    });
  }
}
