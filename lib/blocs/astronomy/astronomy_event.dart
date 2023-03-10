part of 'astronomy_bloc.dart';

abstract class AstronomyEvent extends Equatable {
  const AstronomyEvent();

  @override
  List<Object> get props => [];
}

class GetAstronomyInfo extends AstronomyEvent {
  final Place selPlace;
  const GetAstronomyInfo({required this.selPlace});

  @override
  List<Object> get props => [selPlace];
}
