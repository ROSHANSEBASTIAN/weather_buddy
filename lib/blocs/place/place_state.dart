part of 'place_bloc.dart';

abstract class PlaceState extends Equatable {
  const PlaceState();

  @override
  List<Object> get props => [];
}

class PlaceInitial extends PlaceState {
  final bool loading;
  const PlaceInitial() : loading = false;
}

class PlaceListLoading extends PlaceState {
  final bool loading;
  const PlaceListLoading() : loading = true;
}

class PlaceListLoadSuccess extends PlaceState {
  final bool loading;
  final List<Place> placeList;
  const PlaceListLoadSuccess({required this.placeList}) : loading = false;
}

class PlaceListLoadError extends PlaceState {
  final bool loading;
  final String error;
  const PlaceListLoadError({required this.error}) : loading = false;
}
