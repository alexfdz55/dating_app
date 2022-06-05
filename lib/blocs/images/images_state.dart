part of 'images_bloc.dart';

abstract class ImagesState extends Equatable {
  const ImagesState();

  @override
  List<Object> get props => [];
}

class ImagesLoading extends ImagesState {}

class ImagesLoaded extends ImagesState {
  final List<dynamic> imaUrls;

  const ImagesLoaded({this.imaUrls = const []});

  @override
  List<Object> get props => [imaUrls];
}
