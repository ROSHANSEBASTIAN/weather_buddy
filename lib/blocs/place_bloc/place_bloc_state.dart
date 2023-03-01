part of 'place_bloc_bloc.dart';

class PlaceBlocState extends Equatable {
  final Place selPlace;

  PlaceBlocState({required this.selPlace});

  @override
  List<Object> get props => [selPlace];
}

class PlaceBlocInitial extends PlaceBlocState {
  PlaceBlocInitial() : super(selPlace: Config.defaultPlace);
}
