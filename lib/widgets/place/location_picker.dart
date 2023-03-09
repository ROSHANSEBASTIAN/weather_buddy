import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_buddy/blocs/place/place_bloc.dart';

import '../../utils/basic_imports.dart';

import '../../models/place/place.dart';
import '../../widgets/place/location_list_item.dart';
import '../../controllers/location_selection_controller.dart';
import '../../widgets/common/empty_component.dart';

class LocationPicker extends StatefulWidget {
  final LocationSelectionController locationController;

  const LocationPicker({
    Key? key,
    required this.locationController,
  }) : super(key: key);

  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  List<Place>? searchedPlaces;
  List<Widget> placeWidgetsList = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  void onSubmitted() async {
    BlocProvider.of<PlaceBloc>(context).add(
      SearchPlaceEvent(
          searchString: widget.locationController.searchEditingController.text),
    );
  }

  void locationSelectionHandler(Place selPlace) {
    widget.locationController.confirmSelectedLocation(
      context: context,
      selPlace: selPlace,
    );
  }

  void populateWidgetsList(List<Place> list) {
    placeWidgetsList = [];
    Future future = Future(() {});
    list.forEach((place) {
      future = future.then((_) {
        return Future.delayed(const Duration(milliseconds: 60), () {
          placeWidgetsList.add(
            LocationListItem(
              place: place,
              locationSelectionHandler: locationSelectionHandler,
            ),
          );
          _listKey.currentState!.insertItem(placeWidgetsList.length - 1);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextField(
            style: AppStyles.p4.copyWith(
              color: AppColors.accentColor,
              height: 0,
            ),
            textInputAction: TextInputAction.search,
            onSubmitted: ((value) => onSubmitted()),
            controller: widget.locationController.searchEditingController,
            maxLines: 1,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.enterPlace,
              suffix: IconButton(
                onPressed: (() => onSubmitted()),
                icon: const Icon(
                  Icons.search,
                  size: 20,
                  color: AppColors.accentColor,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        BlocBuilder<PlaceBloc, PlaceState>(
          builder: (context, state) {
            if (state is PlaceListLoadSuccess) {
              populateWidgetsList(state.placeList);
              return Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: AnimatedList(
                    key: _listKey,
                    initialItemCount: placeWidgetsList.length,
                    itemBuilder: (context, index, animation) {
                      return SizeTransition(
                        sizeFactor: animation,
                        child: placeWidgetsList[index],
                      );
                    },
                  ),
                ),
              );
            } else if (state is PlaceListLoading) {
              return EmptyComponent(
                loading: true,
                isAList: true,
                loadingColor: AppColors.grey5,
              );
            } else if (state is PlaceListLoadError) {
              return EmptyComponent(
                loading: false,
                isAList: true,
                error: state.error,
              );
            } else {
              return EmptyComponent(
                loading: false,
                isAList: true,
                emptyText: AppLocalizations.of(context)!.no_data_found,
              );
            }
          },
        ),
      ],
    );
  }
}
