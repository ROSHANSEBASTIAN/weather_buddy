import 'package:weather_buddy/navigation/routes.dart';

import '../utils/screen_imports.dart';

import '../controllers/location_selection_controller.dart';
import '../widgets/place/location_picker.dart';

class LocationSelectionScreen extends StatelessWidget {
  LocationSelectionScreen({Key? key}) : super(key: key);

  final LocationSelectionController locationController =
      LocationSelectionController();

  void mapHandler(BuildContext context) {
    Navigator.of(context).pushNamed(mapSelectionScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CommonAppBar(titleText: AppLocalizations.of(context)!.selectLocation),
      backgroundColor: AppColors.grey1,
      resizeToAvoidBottomInset: false,
      body: LocationPicker(
        locationController: locationController,
      ),
    );
  }
}
