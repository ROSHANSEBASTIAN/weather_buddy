part of 'place_bloc_bloc.dart';

abstract class PlaceBlocState extends Equatable {
  bool loading;
  Place? place;

  PlaceBlocState({required this.loading, this.place});

  @override
  List<Object> get props => [];
}

class PlaceBlocInitial extends PlaceBlocState {
  PlaceBlocInitial({required super.loading});
}
