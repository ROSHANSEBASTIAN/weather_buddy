part of 'place_bloc.dart';

abstract class PlaceEvent extends Equatable {
  const PlaceEvent();

  @override
  List<Object> get props => [];
}

class SearchPlaceEvent extends PlaceEvent {
  final String searchString;
  const SearchPlaceEvent({required this.searchString});
}
