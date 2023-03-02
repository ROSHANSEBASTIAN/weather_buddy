import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/weather/weather_bloc.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';
import '../widgets/home/home_horizontal_list.dart';
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
  //

  final HomeController _homeController = HomeController();
  @override
  void initState() {
    super.initState();
    checkForLocationAndWeather();
  }

  void checkForLocationAndWeather() async {
    final place = await _homeController.checkForLocation(
      context: context,
    );
    BlocProvider.of<WeatherBloc>(context).add(
      GetCurrentWeatherEvent(selectedPlace: place),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1,
      appBar: CommonAppBar(titleText: AppLocalizations.of(context)!.appName),
      body: Container(
        decoration: AppStyles.decorationGradient1,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  const WeatherAnimated(),
                  SelectedLocationInfoCard(
                    context: context,
                  ),
                ],
              ),
              const HomeHorizontalList(),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
