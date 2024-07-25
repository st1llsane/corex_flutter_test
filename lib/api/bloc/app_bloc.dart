import 'package:corex_flutter_test/api/repos/app/abstract_app_repo.dart';
import 'package:corex_flutter_test/shared/models/user/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AbstractAppRepo appRepo;

  AppBloc(this.appRepo) : super(AppInitial()) {
    on<LoadUsers>((event, emit) async {
      try {
        emit(UsersLoading());

        final users = await appRepo.getUsers();

        emit(UsersLoaded(users: users));
      } catch (e) {
        emit(UsersLoadingError(exception: e));
      }
    });
  }
}
