import 'package:weather_buddy/blocs/sports/sports_bloc.dart';

import './utils/basic_imports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/weather/weather_bloc.dart';
import '../blocs/place_bloc/place_bloc_bloc.dart';
import '../../blocs/forecast/forecast_bloc.dart';
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
        BlocProvider<PlaceBlocBloc>(create: (context) => PlaceBlocBloc()),
        BlocProvider<WeatherBloc>(create: (context) => WeatherBloc()),
        BlocProvider<ForecastBloc>(create: (context) => ForecastBloc()),
        BlocProvider<SportsBloc>(create: (context) => SportsBloc()),
      ],
      child: MaterialApp(
        initialRoute: app_routes.homeTabs,
        routes: app_routes.routeConfig,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: AppColors.primaryColor,
            onPrimary: AppColors.white,
            secondary: AppColors.accentColor,
            onSecondary: AppColors.white,
            error: AppColors.red,
            onError: AppColors.white,
            background: AppColors.grey1,
            onBackground: AppColors.grey5,
            surface: AppColors.white,
            onSurface: AppColors.grey5,
          ),
        ),
      ),
    );
  }
}
