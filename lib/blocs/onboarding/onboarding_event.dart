part of 'onboarding_bloc.dart';

abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object?> get props => [];
}

class StartOnboarding extends OnboardingEvent {
  final User user;

  const StartOnboarding(
      {this.user = const User(
        id: '',
        name: '',
        age: 0,
        gender: '',
        imageUrls: [],
        interests: [],
        bio: '',
        jobTitle: '',
        location: '',
      )});

  @override
  List<Object?> get props => [user];
}

class UpdateUser extends OnboardingEvent {
  final User user;

  const UpdateUser({required this.user});

  @override
  List<Object?> get props => [user];
}

class UpdateUserImage extends OnboardingEvent {
  final User? user;
  final XFile image;

  const UpdateUserImage({this.user, required this.image});

  @override
  List<Object?> get props => [user, image];
}
