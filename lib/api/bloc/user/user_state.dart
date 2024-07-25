part of 'user_bloc.dart';

class UserState {}

// users
class UsersInitial extends UserState {}

class UsersLoading extends UserState {}

class UsersLoaded extends UserState {
  final List<User> users;

  UsersLoaded({
    required this.users,
  });
}

class UsersLoadingError extends UserState {
  final Object? exception;

  UsersLoadingError({
    this.exception,
  });
}

// user by id
class UserByIdInitial extends UserState {}

class UserByIdLoading extends UserState {}

class UserByIdLoaded extends UserState {
  final User user;

  UserByIdLoaded({
    required this.user,
  });
}

class UserByIdLoadingError extends UserState {
  final Object? exception;

  UserByIdLoadingError({
    this.exception,
  });
}
