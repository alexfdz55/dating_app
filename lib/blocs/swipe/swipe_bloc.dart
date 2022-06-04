import 'package:bloc/bloc.dart';
import 'package:dating_app/models/models.dart';
import 'package:equatable/equatable.dart';

part 'swipe_event.dart';
part 'swipe_state.dart';

class SwipeBloc extends Bloc<SwipeEvent, SwipeState> {
  SwipeBloc() : super(SwipeLoadingState()) {
    on<LoadUsersEvent>((event, emit) {
      emit(SwipeLoadedState(users: event.users));
    });

    on<SwipeLeftEvent>((event, emit) {
      if (state is SwipeLoadedState) {
        final currentState = state as SwipeLoadedState;
        emit(SwipeLoadedState(
            users: List.from(currentState.users)..remove(event.user)));
      }
    });

    on<SwipeRightEvent>((event, emit) {
      if (state is SwipeLoadedState) {
        final currentState = state as SwipeLoadedState;
        emit(SwipeLoadedState(
            users: List.from(currentState.users)..remove(event.user)));
      }
    });
  }
}
