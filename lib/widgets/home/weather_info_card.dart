import '../../utils/basic_imports.dart';
import '../../models/weather/weather.dart';

class WeatherInfoCard extends StatelessWidget {
  final Weather currentWeather;

  const WeatherInfoCard({Key? key, required this.currentWeather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 400),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Padding(
            padding: EdgeInsets.only(top: value * 25),
            child: child,
          ),
        );
      },
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                        "https:${currentWeather.current!.condition!.icon!}",
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${currentWeather.current!.feelslikeC!.toString()}${AppLocalizations.of(context)!.degree_celsius} / ${currentWeather.current!.feelslikeF!.toString()}${AppLocalizations.of(context)!.degree_fahrenheit}",
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
                      " ${AppLocalizations.of(context)!.speed}: ${currentWeather.current!.windKph!.toString()} Kph/ ${currentWeather.current!.windMph!.toString()} Mph",
                      style: AppStyles.h3.copyWith(color: AppColors.white),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      " ${AppLocalizations.of(context)!.direction}: ${currentWeather.current!.windDir}",
                      style: AppStyles.h3.copyWith(color: AppColors.white),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      " ${AppLocalizations.of(context)!.degree}: ${currentWeather.current!.windDegree!.toString()}",
                      style: AppStyles.h3.copyWith(color: AppColors.white),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      " ${AppLocalizations.of(context)!.humidity}: ${currentWeather.current!.humidity!.toString()}",
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${AppLocalizations.of(context)!.weather}: ${currentWeather.current!.condition!.text!}",
                      style: AppStyles.h1.copyWith(color: AppColors.white),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      "${AppLocalizations.of(context)!.uv}: ${currentWeather.current!.uv}",
                      style: AppStyles.h1.copyWith(color: AppColors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
