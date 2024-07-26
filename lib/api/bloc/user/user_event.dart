part of 'user_bloc.dart';

abstract class UserEvent {}

// users
class LoadUsers implements UserEvent {
  final Completer? completer;

  LoadUsers({
    this.completer,
  });
}

// user by id
class LoadUserById implements UserEvent {
  final String userId;

  LoadUserById({
    required this.userId,
  });
}
