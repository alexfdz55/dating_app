import 'package:bloc/bloc.dart';
import 'package:dating_app/models/models.dart';
import 'package:equatable/equatable.dart';

part 'swipe_event.dart';
part 'swipe_state.dart';

class SwipeBloc extends Bloc<SwipeEvent, SwipeState> {
  SwipeBloc() : super(SwipeLoading()) {
    on<LoadUsers>((event, emit) {
      emit(SwipeLoaded(users: event.users));
    });

    on<SwipeLeft>((event, emit) {
      if (state is SwipeLoaded) {
        final currentState = state as SwipeLoaded;
        try {
          emit(SwipeLoaded(
              users: List.from(currentState.users)..remove(event.user)));
        } catch (_) {}
      }
    });

    on<SwipeRight>((event, emit) {
      if (state is SwipeLoaded) {
        final currentState = state as SwipeLoaded;
        try {
          emit(SwipeLoaded(
              users: List.from(currentState.users)..remove(event.user)));
        } catch (_) {}
      }
    });
  }
}
