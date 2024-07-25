// import 'package:corex_flutter_test/api/repos/app/abstract_app_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<LoadUsers>((event, emit) {
      print('LOAD USER');
    });
  }

  // final AbstractAppRepo appRepo;
}
