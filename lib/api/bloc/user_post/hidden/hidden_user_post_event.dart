part of 'hidden_user_post_bloc.dart';

abstract class HiddenUserPostEvent {}

class HideUserPost extends HiddenUserPostEvent {
  final UserPost post;

  HideUserPost({required this.post});
}
