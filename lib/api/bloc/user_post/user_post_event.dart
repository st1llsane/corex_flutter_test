part of 'user_post_bloc.dart';

abstract class UserPostEvent {}

// posts
class LoadUsersPosts implements UserPostEvent {
  final Completer? completer;

  LoadUsersPosts({
    this.completer,
  });
}

// post by id
class LoadUserPostById implements UserPostEvent {
  final String postId;

  LoadUserPostById({
    required this.postId,
  });
}
