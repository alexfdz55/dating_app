import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dating_app/blocs/blocs.dart';
import 'package:dating_app/models/models.dart';
import 'package:dating_app/repositories/repositories.dart';
import 'package:equatable/equatable.dart';

part 'swipe_event.dart';
part 'swipe_state.dart';

class SwipeBloc extends Bloc<SwipeEvent, SwipeState> {
  final AuthBloc _authBloc;
  final DatabaseRepository _databaseRepository;

  StreamSubscription? _authSubscription;

  SwipeBloc({
    required AuthBloc authBloc,
    required DatabaseRepository databaseRepository,
  })  : _authBloc = authBloc,
        _databaseRepository = databaseRepository,
        super(SwipeLoading()) {
    on<LoadUsers>((event, emit) {
      _databaseRepository.getUsers(event.userId, 'Male').listen((users) {
        print('$users');
        add(UpdateHome(users: users));
      });
    });

    on<UpdateHome>((event, emit) {
      if (event.users != null) {
        emit(SwipeLoaded(users: event.users!));
      } else {
        emit(SwipeError());
      }
    });

    on<SwipeLeft>((event, emit) {
      if (state is SwipeLoaded) {
        final currentState = state as SwipeLoaded;
        List<User> users = List.from(currentState.users)..remove(event.user);
        if (users.isNotEmpty) {
          emit(SwipeLoaded(users: users));
        } else {
          emit(SwipeError());
        }
      }
    });

    on<SwipeRight>((event, emit) {
      if (state is SwipeLoaded) {
        final currentState = state as SwipeLoaded;
        List<User> users = List.from(currentState.users)..remove(event.user);
        if (users.isNotEmpty) {
          emit(SwipeLoaded(users: users));
        } else {
          emit(SwipeError());
        }
      }
    });

    _authSubscription = _authBloc.stream.listen((state) {
      if (state.status == AuthStatus.authenticated) {
        add(LoadUsers(userId: state.user!.uid));
      }
    });
  }

  @override
  Future<void> close() async {
    await _authSubscription?.cancel();
    super.close();
  }
}
