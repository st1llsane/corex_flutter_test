part of 'user_bloc.dart';

abstract class UserState {}

// users
class UsersInitial implements UserState {}

class UsersLoading implements UserState {}

class UsersLoaded implements UserState {
  final List<User> users;

  UsersLoaded({
    required this.users,
  });
}

class UsersLoadingError implements UserState {
  final Object? exception;

  UsersLoadingError({
    this.exception,
  });
}

// user by id
class UserByIdInitial implements UserState {}

class UserByIdLoading implements UserState {}

class UserByIdLoaded implements UserState {
  final User user;

  UserByIdLoaded({
    required this.user,
  });
}

class UserByIdLoadingError implements UserState {
  final Object? exception;

  UserByIdLoadingError({
    this.exception,
  });
}
