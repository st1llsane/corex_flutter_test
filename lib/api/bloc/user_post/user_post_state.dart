part of 'user_post_bloc.dart';

abstract class UserPostState {}

// posts
class UserPostsInitial extends UserPostState {}

class UserPostsLoading extends UserPostState {}

class UserPostsLoaded extends UserPostState {
  final List<UserPost> usersPosts;

  UserPostsLoaded({
    required this.usersPosts,
  });
}

class UserPostsLoadingError extends UserPostState {
  final Object? exception;

  UserPostsLoadingError({
    this.exception,
  });
}

// post by id
class UserPostByIdInitial extends UserPostState {}

class UserPostByIdLoading extends UserPostState {}

class UserPostByIdLoaded extends UserPostState {
  final UserPost userPost;

  UserPostByIdLoaded({
    required this.userPost,
  });
}

class UserPostByIdLoadingError extends UserPostState {
  final Object? exception;

  UserPostByIdLoadingError({
    this.exception,
  });
}
