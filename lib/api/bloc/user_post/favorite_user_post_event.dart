part of 'favorite_user_post_bloc.dart';

abstract class FavoriteUserPostEvent {}

class AddUserPostToFavorite extends FavoriteUserPostEvent {
  final UserPost post;

  AddUserPostToFavorite({required this.post});
}

class RemoveUserPostFromFavorite extends FavoriteUserPostEvent {
  final UserPost post;

  RemoveUserPostFromFavorite({required this.post});
}
