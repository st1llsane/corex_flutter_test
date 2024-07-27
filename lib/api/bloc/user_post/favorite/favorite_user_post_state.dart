part of 'favorite_user_post_bloc.dart';

abstract class FavoriteUserPostState {
  List<UserPost> favoritePosts;

  FavoriteUserPostState({
    required this.favoritePosts,
  });
}

class FavoriteUsersPostsInitial extends FavoriteUserPostState {
  FavoriteUsersPostsInitial() : super(favoritePosts: []);
}

class FavoriteUserPostAdding extends FavoriteUserPostState {
  FavoriteUserPostAdding({required super.favoritePosts});
}

class FavoriteUserPostRemoving extends FavoriteUserPostState {
  FavoriteUserPostRemoving({required super.favoritePosts});
}
