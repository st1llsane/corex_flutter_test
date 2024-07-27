// import 'package:corex_flutter_test/api/repos/user_post/abstract_favorite_user_post_repo.dart';
import 'package:corex_flutter_test/shared/models/user_post/user_post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'hidden_user_post_event.dart';
part 'hidden_user_post_state.dart';

class HiddenUserPostBloc
    extends Bloc<HiddenUserPostEvent, HiddenUserPostState> {
  HiddenUserPostBloc() : super(HiddenUsersPostsInitial()) {
    on<HideUserPost>((event, emit) {
      final updatedHiddenPosts = List<UserPost>.from(state.hiddenPosts)
        ..add(event.post);

      emit(HiddenUserPostAdding(hiddenPosts: updatedHiddenPosts));
    });
  }
}
