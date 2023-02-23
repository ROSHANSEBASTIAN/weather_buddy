import 'navigation/routes.dart' as app_routes;
import './utils/basic_imports.dart';

void main() {
  runApp(const WeatherBuddy());
}

class WeatherBuddy extends StatelessWidget {
  const WeatherBuddy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: app_routes.homeScreen,
      routes: app_routes.routeConfig,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
