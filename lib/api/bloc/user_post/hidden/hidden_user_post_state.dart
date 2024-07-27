part of 'hidden_user_post_bloc.dart';

abstract class HiddenUserPostState {
  List<UserPost> hiddenPosts;

  HiddenUserPostState({
    required this.hiddenPosts,
  });
}

class HiddenUsersPostsInitial extends HiddenUserPostState {
  HiddenUsersPostsInitial() : super(hiddenPosts: []);
}

class HiddenUserPostAdding extends HiddenUserPostState {
  HiddenUserPostAdding({required super.hiddenPosts});
}
