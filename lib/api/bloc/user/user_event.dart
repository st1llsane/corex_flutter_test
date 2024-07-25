part of 'user_bloc.dart';

class UserEvent {}

// users
class LoadUsers extends UserEvent {}

// user by id
class LoadUserById extends UserEvent {
  final String userId;

  LoadUserById({
    required this.userId,
  });
}
