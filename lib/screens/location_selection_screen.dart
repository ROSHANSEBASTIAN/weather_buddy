import '../utils/basic_imports.dart';
import '../controllers/location_selection_controller.dart';
import '../widgets/place/location_picker.dart';

class LocationSelectionScreen extends StatelessWidget {
  LocationSelectionScreen({Key? key}) : super(key: key);

  final LocationSelectionController locationController =
      LocationSelectionController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.selectLocation),
      ),
      backgroundColor: AppColors.grey1,
      resizeToAvoidBottomInset: false,
      body: LocationPicker(
        locationController: locationController,
      ),
    );
  }
}
