import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dating_app/repositories/database/database_repository.dart';
import 'package:equatable/equatable.dart';

part 'images_event.dart';
part 'images_state.dart';

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  final DatabaseRepository _databaseRepository;

  StreamSubscription? _databaseSubscription;

  ImagesBloc({required DatabaseRepository databaseRepository})
      : _databaseRepository = databaseRepository,
        super(ImagesLoading()) {
    on<LoadImages>((event, emit) {
      _databaseSubscription?.cancel();
      _databaseRepository
          .getUser()
          .listen((user) => add(UpdateImages(user.imageUrls)));
    });

    on<UpdateImages>((event, emit) {
      emit(ImagesLoaded(imaUrls: event.imageUrls));
    });
  }
}
