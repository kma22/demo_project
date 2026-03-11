part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitialState extends ProfileState {
  const ProfileInitialState();
}

class ProfileLoadingState extends ProfileState {
  const ProfileLoadingState();
}

class ProfileSuccessState extends ProfileState {
  const ProfileSuccessState();
}

class ProfileErrorState extends ProfileState {
  final String? message;

  const ProfileErrorState({this.message});

  @override
  List<Object?> get props => [message];
}
