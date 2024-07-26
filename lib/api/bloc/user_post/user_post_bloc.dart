import 'dart:async';

import 'package:corex_flutter_test/api/repos/user_post/abstract_user_repo.dart';
import 'package:corex_flutter_test/shared/models/post/post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_post_event.dart';
part 'user_post_state.dart';

class UserPostBloc extends Bloc<UserPostEvent, UserPostState> {
  final AbstractUserPostRepo userPostRepo;

  UserPostBloc(this.userPostRepo) : super(UserPostsInitial()) {
    on<LoadUsersPosts>((event, emit) async {
      try {
        if (state is! UserPostsLoaded) {
          emit(UserPostsLoading());
        }

        final usersPosts = await userPostRepo.getUsersPosts();
        emit(UserPostsLoaded(usersPosts: usersPosts));
      } catch (e) {
        emit(UserPostsLoadingError(exception: e));
      } finally {
        event.completer?.complete();
      }
    });

    on<LoadUserPostById>((event, emit) async {
      try {
        if (state is! UserPostByIdLoaded) {
          emit(UserPostsLoading());
        }

        final userPost = await userPostRepo.getUserPostById(event.userId);
        emit(UserPostByIdLoaded(userPost: userPost));
      } catch (e) {
        emit(UserPostByIdLoadingError(exception: e));
      }
    });
  }
}
