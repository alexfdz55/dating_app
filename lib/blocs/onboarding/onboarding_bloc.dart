import 'package:bloc/bloc.dart';
import 'package:dating_app/models/models.dart';
import 'package:dating_app/repositories/repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final DatabaseRepository _databaseRepository;
  final StorageRepository _storageRepository;

  OnboardingBloc({
    required DatabaseRepository databaseRepository,
    required StorageRepository storageRepository,
  })  : _databaseRepository = databaseRepository,
        _storageRepository = storageRepository,
        super(OnboardingLoading()) {
    on<StartOnboarding>(_onStartOnboarding);

    on<UpdateUser>(_onUpdateUser);

    on<UpdateUserImage>(_onUpdateUserImage);
  }

  void _onStartOnboarding(
      StartOnboarding event, Emitter<OnboardingState> emit) async {
    await _databaseRepository.createUser(event.user);

    emit(OnboardingLoaded(user: event.user));
  }

  void _onUpdateUser(UpdateUser event, Emitter<OnboardingState> emit) async {
    if (state is OnboardingLoaded) {
      _databaseRepository.updateUser(event.user);
      emit(OnboardingLoaded(user: event.user));
    }
  }

  void _onUpdateUserImage(
      UpdateUserImage event, Emitter<OnboardingState> emit) async {
    if (state is OnboardingLoaded) {
      User user = (state as OnboardingLoaded).user;

      await _storageRepository.uploadImage(user, event.image);

      _databaseRepository.getUser(user.id!).listen((user) {
        add(UpdateUser(user: user));
      });
    }
  }
}
