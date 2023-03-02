import 'package:weather_buddy/models/weather_forecast/astro.dart';
import 'package:weather_buddy/models/weather_forecast/forecastday.dart';
import 'package:weather_buddy/models/weather_forecast/hour.dart';

import '../../utils/basic_imports.dart';

class ForecastListItem extends StatelessWidget {
  final Forecastday dayForecast;

  const ForecastListItem({Key? key, required this.dayForecast})
      : super(key: key);

  Widget renderKeyValuePair({required String key, required String value}) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              key,
              textAlign: TextAlign.start,
              style: AppStyles.p3,
            ),
            Text(
              value,
              textAlign: TextAlign.start,
              style: AppStyles.h3,
            ),
          ],
        )
      ],
    );
  }

  Widget renderAstronomyInfo({
    required BuildContext context,
    required Astro astroInfo,
  }) {
    return ExpansionTile(
      initiallyExpanded: false,
      title: Text(
        AppLocalizations.of(context)!.astronomy,
        style: AppStyles.h3,
      ),
      subtitle: Text(
        AppLocalizations.of(context)!.astronomy_info_for_the_day,
        style: AppStyles.p3,
      ),
      children: [
        renderKeyValuePair(
          key: AppLocalizations.of(context)!.sun_rise,
          value: astroInfo.sunrise!,
        ),
        renderKeyValuePair(
          key: AppLocalizations.of(context)!.sun_set,
          value: astroInfo.sunset!,
        ),
        renderKeyValuePair(
          key: AppLocalizations.of(context)!.moon_rise,
          value: astroInfo.moonrise!,
        ),
        renderKeyValuePair(
          key: AppLocalizations.of(context)!.moon_set,
          value: astroInfo.moonset!,
        ),
        renderKeyValuePair(
          key: AppLocalizations.of(context)!.moon_phase,
          value: astroInfo.moonPhase!,
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget renderHourlyForecastList({
    required BuildContext context,
    required List<Hour> hourWiseList,
  }) {
    return ExpansionTile(
      initiallyExpanded: false,
      title: Text(
        AppLocalizations.of(context)!.hourly_forecast,
        style: AppStyles.h3,
      ),
      children: [
        ...hourWiseList.map(
          (forecast) => ListTile(
            leading: Text(
              forecast.time!.split(" ")[1],
              textAlign: TextAlign.center,
            ),
            title: Text(forecast.condition!.text!),
            subtitle: Text(
              "${forecast.tempC} ${AppLocalizations.of(context)!.degree_celsius}/${forecast.tempF} ${AppLocalizations.of(context)!.degree_fahrenheit}",
            ),
            trailing: Text(
                "${AppLocalizations.of(context)!.humidity}: ${forecast.humidity}"),
          ),
        )
      ],
    );
  }

  Widget renderDayOverview(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  dayForecast.date ?? "",
                  style: AppStyles.h2,
                ),
                Text(
                  dayForecast.day!.condition!.text!,
                  style: AppStyles.h3.copyWith(
                    color: AppColors.accentColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            renderKeyValuePair(
              key: AppLocalizations.of(context)!.avg_humidity,
              value: dayForecast.day!.avghumidity.toString(),
            ),
            renderKeyValuePair(
              key: AppLocalizations.of(context)!.avg_temp,
              value:
                  "${dayForecast.day!.avgtempC}${AppLocalizations.of(context)!.degree_celsius}/ ${dayForecast.day!.avgtempF}${AppLocalizations.of(context)!.degree_fahrenheit}",
            ),
            renderKeyValuePair(
              key: AppLocalizations.of(context)!.uv,
              value: dayForecast.day!.uv.toString(),
            ),
            renderKeyValuePair(
              key: AppLocalizations.of(context)!.wind,
              value:
                  "${dayForecast.day!.maxwindKph} Kph/ ${dayForecast.day!.maxwindMph} Mph",
            ),
            const SizedBox(
              height: 10,
            ),
            renderAstronomyInfo(
              context: context,
              astroInfo: dayForecast.astro!,
            ),
            const SizedBox(height: 10),
            renderHourlyForecastList(
              context: context,
              hourWiseList: dayForecast.hour!,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          renderDayOverview(context),
        ],
      ),
    );
  }
}
