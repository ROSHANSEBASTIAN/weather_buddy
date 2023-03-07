part of 'sports_bloc.dart';

abstract class SportsEvent extends Equatable {
  const SportsEvent();

  @override
  List<Object> get props => [];
}

class GetSportsEvents extends SportsEvent {
  final Place selPlace;

  const GetSportsEvents({required this.selPlace});

  @override
  List<Object> get props => [selPlace];
}
