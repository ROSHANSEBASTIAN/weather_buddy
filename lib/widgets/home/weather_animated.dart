import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

import '../../widgets/home/weather_info_card.dart';
import '../../utils/basic_imports.dart';
import '../../blocs/weather/weather_bloc.dart';

class WeatherAnimated extends StatefulWidget {
  const WeatherAnimated({
    Key? key,
  }) : super(key: key);

  @override
  State<WeatherAnimated> createState() => _WeatherAnimatedState();
}

class _WeatherAnimatedState extends State<WeatherAnimated> {
  String defaultRive = "assets/rive/weather_icon.riv";
  String loadingRive = "assets/rive/loading.riv";
  String cloudRive = "assets/rive/cloud_icon.riv";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
        if (state is WeatherDataLoaded) {
          return WeatherInfoCard(currentWeather: state.currentWeather);
        } else {
          return RiveAnimation.asset(
            defaultRive,
            fit: BoxFit.cover,
          );
        }
      }),
    );
  }
}
