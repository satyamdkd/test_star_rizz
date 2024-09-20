part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class HomeLoadingEvent extends HomeEvent {}

final class HomeLoginButtonPressed extends HomeEvent {
  final String userId;
  final String password;
  final BuildContext context;

  HomeLoginButtonPressed(this.userId, this.password, this.context);

  List<Object> get props => [userId, password, context];
}

final class HomeSuccessEvent extends HomeEvent {}

final class HomeFailureEvent extends HomeEvent {}
