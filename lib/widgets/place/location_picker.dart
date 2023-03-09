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
  bool _loadingForSearching = false;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  void onSubmitted() async {
    setState(() {
      _loadingForSearching = true;
    });
    try {
      final list = await widget.locationController.placeVerificationHandler();
      setState(() {
        searchedPlaces = list;
      });
      populateWidgetsList(list);
    } catch (error) {
      print("Error while searching ${error.toString()}");
    } finally {
      setState(() {
        _loadingForSearching = false;
      });
    }
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
        widget.locationController.showEmptyComponent(
          loading: _loadingForSearching,
          placeList: searchedPlaces,
        )
            ? EmptyComponent(
                loading: _loadingForSearching,
                isAList: true,
                list: searchedPlaces,
                loadingColor: AppColors.grey5,
              )
            : Expanded(
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
              )
      ],
    );
  }
}

// ListView.builder(
//                     itemBuilder: (context, index) => LocationListItem(
//                       place: searchedPlaces![index],
//                       locationSelectionHandler: locationSelectionHandler,
//                     ),
//                     itemCount: searchedPlaces?.length,
//                   ),