import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dating_app/blocs/blocs.dart';
import 'package:dating_app/repositories/database/database_repository.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthBloc _authBloc;
  final DatabaseRepository _databaseRepository;

  StreamSubscription? _authSubscription;

  ProfileBloc({
    required AuthBloc authBloc,
    required DatabaseRepository databaseRepository,
  })  : _authBloc = authBloc,
        _databaseRepository = databaseRepository,
        super(ProfileLoading()) {
    on<LoadProfile>(_onLoadProfile);

    on<UpdateProfile>(_onUpdateProfile);

    _authSubscription = _authBloc.stream.listen((state) {
      if (state.user != null) {
        add(LoadProfile(userId: state.user!.uid));
      }
    });
  }

  _onLoadProfile(LoadProfile event, Emitter<ProfileState> emit) {
    _databaseRepository.getUser(event.userId).listen((user) {
      add(UpdateProfile(user: user));
    });
  }

  _onUpdateProfile(UpdateProfile event, Emitter<ProfileState> emit) {
    print(event.user);
    emit(ProfileLoaded(user: event.user));
  }

  @override
  Future<void> close() async {
    _authSubscription?.cancel();
    return super.close();
  }
}
