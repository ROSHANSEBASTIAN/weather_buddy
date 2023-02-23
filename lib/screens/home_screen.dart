import 'package:weather_buddy/widgets/home/location_picker.dart';
import 'package:weather_buddy/widgets/home/weather_animated.dart';

import '../utils/screen_imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(titleText: AppLocalizations.of(context)!.appName),
      body: Column(
        children: [
          const WeatherAnimated(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Card(
              elevation: 6,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                height: 200,
              ),
            ),
          ),
          const LocationPicker(),
        ],
      ),
    );
  }
}
