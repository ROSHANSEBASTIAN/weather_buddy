part of 'sports_bloc.dart';

abstract class SportsState extends Equatable {
  const SportsState();

  @override
  List<Object> get props => [];
}

class SportsInitial extends SportsState {
  final bool loading;
  const SportsInitial() : loading = false;

  @override
  List<Object> get props => [loading];
}

class SportsDataLoading extends SportsState {
  final bool loading;
  const SportsDataLoading() : loading = true;

  @override
  List<Object> get props => [loading];
}

class SportsDataLoaded extends SportsState {
  final bool loading;
  final Sports sportsInfo;
  const SportsDataLoaded({required this.sportsInfo}) : loading = false;

  @override
  List<Object> get props => [sportsInfo, loading];
}

class SportsDataLoadError extends SportsState {
  final bool loading;
  final String error;
  const SportsDataLoadError({required this.error}) : loading = false;

  @override
  List<Object> get props => [error, loading];
}
