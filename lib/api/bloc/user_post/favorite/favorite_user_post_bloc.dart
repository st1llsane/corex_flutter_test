// import 'package:corex_flutter_test/api/repos/user_post/abstract_favorite_user_post_repo.dart';
import 'package:corex_flutter_test/shared/models/user_post/user_post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_user_post_event.dart';
part 'favorite_user_post_state.dart';

class FavoriteUserPostBloc
    extends Bloc<FavoriteUserPostEvent, FavoriteUserPostState> {
  FavoriteUserPostBloc() : super(FavoriteUsersPostsInitial()) {
    on<AddUserPostToFavorite>((event, emit) {
      final updatedFavoritePosts = List<UserPost>.from(state.favoritePosts)
        ..add(event.post);

      emit(FavoriteUserPostAdding(favoritePosts: updatedFavoritePosts));
    });

    on<RemoveUserPostFromFavorite>((event, emit) {
      final updatedFavoritePosts = List<UserPost>.from(state.favoritePosts)
        ..remove(event.post);

      emit(FavoriteUserPostAdding(favoritePosts: updatedFavoritePosts));
    });
  }
}
