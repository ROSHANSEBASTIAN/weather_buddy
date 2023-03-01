import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/place_bloc/place_bloc_bloc.dart';
import './utils/basic_imports.dart';
import 'navigation/routes.dart' as app_routes;
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
      ],
      child: MaterialApp(
        initialRoute: app_routes.homeScreen,
        routes: app_routes.routeConfig,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
