part of 'user_post_bloc.dart';

abstract class UserPostState {}

// posts
class UserPostsInitial implements UserPostState {}

class UserPostsLoading implements UserPostState {}

class UserPostsLoaded implements UserPostState {
  final List<UserPost> usersPosts;

  UserPostsLoaded({
    required this.usersPosts,
  });
}

class UserPostsLoadingError implements UserPostState {
  final Object? exception;

  UserPostsLoadingError({
    this.exception,
  });
}

// post by id
class UserPostByIdInitial implements UserPostState {}

class UserPostByIdLoading implements UserPostState {}

class UserPostByIdLoaded implements UserPostState {
  final UserPost userPost;

  UserPostByIdLoaded({
    required this.userPost,
  });
}

class UserPostByIdLoadingError implements UserPostState {
  final Object? exception;

  UserPostByIdLoadingError({
    this.exception,
  });
}
