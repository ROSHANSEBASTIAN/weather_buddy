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
  bool _loadingForSearching = false;

  void onSubmitted() async {
    setState(() {
      _loadingForSearching = true;
    });
    try {
      final list = await widget.locationController.placeVerificationHandler();
      setState(() {
        searchedPlaces = list;
      });
      print("search list is ${list}");
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
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.75,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: widget.locationController.showEmptyComponent(
            loading: _loadingForSearching,
            placeList: searchedPlaces,
          )
              ? EmptyComponent(
                  loading: _loadingForSearching,
                  isAList: true,
                  list: searchedPlaces,
                )
              : ListView.builder(
                  itemBuilder: (context, index) => LocationListItem(
                    place: searchedPlaces![index],
                    locationSelectionHandler: locationSelectionHandler,
                  ),
                  itemCount: searchedPlaces?.length,
                ),
        ),
      ],
    );
  }
}
