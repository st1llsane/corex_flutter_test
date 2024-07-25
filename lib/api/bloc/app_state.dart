part of 'app_bloc.dart';

class AppState {}

class AppInitial extends AppState {}

class UsersLoading extends AppState {}

class UsersLoaded extends AppState {
  final List<User> users;

  UsersLoaded({
    required this.users,
  });
}

class UsersLoadingError extends AppState {
  final Object? exception;

  UsersLoadingError({
    this.exception,
  });
}
