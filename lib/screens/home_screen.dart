import '../utils/screen_imports.dart';
import '../controllers/home_controller.dart';
import '../widgets/home/selected_location_info_card.dart';
import '../widgets/home/weather_animated.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // states

  final HomeController _homeController = HomeController();
  @override
  void initState() {
    super.initState();
    checkForLocation();
  }

  void checkForLocation() async {
    final place = await _homeController.checkForLocation(
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(titleText: AppLocalizations.of(context)!.appName),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                const WeatherAnimated(),
                SelectedLocationInfoCard(
                  context: context,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
