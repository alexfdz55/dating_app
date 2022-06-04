part of 'swipe_bloc.dart';

abstract class SwipeState extends Equatable {
  const SwipeState();

  @override
  List<Object> get props => [];
}

class SwipeLoadingState extends SwipeState {}

class SwipeLoadedState extends SwipeState {
  final List<User> users;

  const SwipeLoadedState({required this.users});
  @override
  List<Object> get props => [users];
}

class SwipeErrorState extends SwipeState {}
