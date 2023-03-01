part of 'place_bloc_bloc.dart';

@immutable
class PlaceBlocEvent extends Equatable {
  PlaceBlocEvent();

  @override
  List<Object> get props => [];
}

class SaveSelectedPlace extends PlaceBlocEvent {
  final Place selPlace;

  SaveSelectedPlace({required this.selPlace});

  @override
  List<Object> get props => [selPlace];
}
