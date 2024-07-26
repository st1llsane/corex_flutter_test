part of 'user_post_bloc.dart';

abstract class UserPostEvent {}

// users
class LoadUsersPosts implements UserPostEvent {
  final Completer? completer;

  LoadUsersPosts({
    this.completer,
  });
}

// user by id
class LoadUserPostById implements UserPostEvent {
  final String postId;

  LoadUserPostById({
    required this.postId,
  });
}
