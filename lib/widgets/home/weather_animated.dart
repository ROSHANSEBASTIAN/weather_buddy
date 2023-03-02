import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import '../../utils/basic_imports.dart';

import '../../blocs/weather/weather_bloc.dart';
import '../../utils/log.dart';

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

  Widget renderWeatherInfo(WeatherDataLoaded state) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColors.white,
                    child: Image.network(
                      "https:${state.currentWeather.current!.condition!.icon!}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${state.currentWeather.current!.feelslikeC!.toString()}${AppLocalizations.of(context)!.degree_celsius} / ${state.currentWeather.current!.feelslikeF!.toString()}${AppLocalizations.of(context)!.degree_fahrenheit}",
                    style: AppStyles.h1.copyWith(
                      color: AppColors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    " ${AppLocalizations.of(context)!.wind}",
                    style: AppStyles.h1.copyWith(color: AppColors.white),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    " ${AppLocalizations.of(context)!.speed}: ${state.currentWeather.current!.windKph!.toString()} Kph/ ${state.currentWeather.current!.windMph!.toString()} Mph",
                    style: AppStyles.h3.copyWith(color: AppColors.white),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    " ${AppLocalizations.of(context)!.direction}: ${state.currentWeather.current!.windDir}",
                    style: AppStyles.h3.copyWith(color: AppColors.white),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    " ${AppLocalizations.of(context)!.degree}: ${state.currentWeather.current!.windDegree!.toString()}",
                    style: AppStyles.h3.copyWith(color: AppColors.white),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    " ${AppLocalizations.of(context)!.humidity}: ${state.currentWeather.current!.humidity!.toString()}",
                    style: AppStyles.h1.copyWith(color: AppColors.white),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${AppLocalizations.of(context)!.weather}: ${state.currentWeather.current!.condition!.text!}",
                    style: AppStyles.h1.copyWith(color: AppColors.white),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "${AppLocalizations.of(context)!.uv}: ${state.currentWeather.current!.uv}",
                    style: AppStyles.h1.copyWith(color: AppColors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          Log.weatherLog("Current state is ${state.toString()}");
          if (state is WeatherDataLoaded) {
            return renderWeatherInfo(state);
          } else {
            return RiveAnimation.asset(
              defaultRive,
              fit: BoxFit.cover,
            );
          }
        },
      ),
    );
  }
}
