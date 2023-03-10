import './utils/basic_imports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/settings/settings_bloc.dart';
import '../blocs/weather/weather_bloc.dart';
import '../blocs/place/place_bloc.dart';
import '../blocs/sports/sports_bloc.dart';
import '../blocs/astronomy/astronomy_bloc.dart';
import '../blocs/forecast/forecast_bloc.dart';
import './navigation/routes.dart' as app_routes;
import './utils/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const WeatherBuddy());
}

class WeatherBuddy extends StatelessWidget {
  const WeatherBuddy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsBloc>(create: (context) => SettingsBloc()),
        BlocProvider<PlaceBloc>(create: (context) => PlaceBloc()),
        BlocProvider<WeatherBloc>(create: (context) => WeatherBloc()),
        BlocProvider<ForecastBloc>(create: (context) => ForecastBloc()),
        BlocProvider<SportsBloc>(create: (context) => SportsBloc()),
        BlocProvider<AstronomyBloc>(create: (context) => AstronomyBloc()),
      ],
      child: MaterialApp(
        initialRoute: app_routes.homeTabs,
        routes: app_routes.routeConfig,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: AppStyles.appTheme,
      ),
    );
  }
}
