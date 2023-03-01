import '../../utils/basic_imports.dart';
import '../../models/place/place.dart';

class LocationListItem extends StatelessWidget {
  final Place place;
  final Function locationSelectionHandler;
  const LocationListItem({
    Key? key,
    required this.place,
    required this.locationSelectionHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (place != null) {
      return Card(
        child: InkWell(
          onTap: (() {
            locationSelectionHandler(place);
          }),
          child: ListTile(
            trailing: Text(
              place.country ?? "",
              style: AppStyles.p3,
            ),
            title: Text(
              place.name ?? "",
              style: AppStyles.h1,
            ),
          ),
        ),
      );
    } else {
      return const SizedBox(
        width: 0,
        height: 0,
      );
    }
  }
}
