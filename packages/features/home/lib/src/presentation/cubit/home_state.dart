part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {
  const HomeInitialState();
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState();
}

class HomeSuccessState extends HomeState {
  const HomeSuccessState();
}

class HomeErrorState extends HomeState {
  final String? message;

  const HomeErrorState({this.message});

  @override
  List<Object?> get props => [message];
}
