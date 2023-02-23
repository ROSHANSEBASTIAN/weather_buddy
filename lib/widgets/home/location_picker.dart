import '../../models/Location.dart';
import "../../utils/basic_imports.dart";
import '../../services//preferences.dart';

class LocationPicker extends StatefulWidget {
  const LocationPicker({Key? key}) : super(key: key);

  @override
  _LocationPickerState createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  Location? selLocation;
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _latController = TextEditingController();
  final TextEditingController _longController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _checkForLocation();
  }

  // callbacks
  void _checkForLocation() async {
    print("checking for location");
    // first check for stored location
    final location = await Preferences.getSelectedLocation();
    setState(() {
      selLocation = location;
    });
    if (location.isAValidLocation) {
      _latController.text = selLocation!.lat ?? "";
      _longController.text = selLocation!.long ?? "";
    } else {
      _latController.text = AppLocalizations.of(context)!.lat;
      _longController.text = AppLocalizations.of(context)!.long;
    }

    print("Selected location is $location");
    if (!selLocation!.isAValidLocation) {
      // request to access location
      showModalBottomSheet(
        context: context,
        clipBehavior: Clip.hardEdge,
        isDismissible: false,
        enableDrag: false,
        builder: (modalContext) {
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Container(
              height: 400,
              width: double.infinity,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      AppLocalizations.of(context)!.selectLocation,
                      style: AppStyles.h1.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextField(
                              style:
                                  AppStyles.p4.copyWith(color: AppColors.white),
                              controller: _placeController,
                              decoration: InputDecoration(
                                enabledBorder: AppStyles.outlineBorder1,
                                focusedBorder: AppStyles.outlineBorder1,
                                labelText:
                                    AppLocalizations.of(context)!.enterPlace,
                                labelStyle: AppStyles.p4.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: TextButton(
                                onPressed: _placeVerificationHandler,
                                child: Text(
                                  AppLocalizations.of(context)!.verifyPlace,
                                  style: AppStyles.h4
                                      .copyWith(color: AppColors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextField(
                              textAlign: TextAlign.center,
                              style:
                                  AppStyles.p4.copyWith(color: AppColors.white),
                              enabled: false,
                              controller: _latController,
                              decoration: InputDecoration(
                                enabledBorder: AppStyles.outlineBorder1,
                                focusedBorder: AppStyles.outlineBorder1,
                                labelText: _latController.text.isNotEmpty &&
                                        _latController.text !=
                                            AppLocalizations.of(context)!.lat
                                    ? AppLocalizations.of(context)!.lat
                                    : "",
                                labelStyle: AppStyles.p4.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextField(
                              style:
                                  AppStyles.p4.copyWith(color: AppColors.white),
                              enabled: false,
                              controller: _longController,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                enabledBorder: AppStyles.outlineBorder1,
                                focusedBorder: AppStyles.outlineBorder1,
                                labelText: _longController.text.isNotEmpty &&
                                        _longController.text !=
                                            AppLocalizations.of(context)!.long
                                    ? AppLocalizations.of(context)!.long
                                    : "",
                                labelStyle: AppStyles.p4.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () => _submitHandler(modalContext),
                      child: Text(AppLocalizations.of(context)!.submit),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }

  void _submitHandler(BuildContext modalContext) {
    Navigator.of(modalContext).pop();
  }

  void _placeVerificationHandler() {}

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 0,
      height: 0,
    );
  }
}
