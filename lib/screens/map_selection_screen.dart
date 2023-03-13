import '../utils/screen_imports.dart';

class MapSelectionScreen extends StatelessWidget {
  const MapSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        titleText: AppLocalizations.of(context)!.selectLocation,
      ),
      body: Container(),
    );
  }
}
