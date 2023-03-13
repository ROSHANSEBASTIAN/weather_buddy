
import '../utils/screen_imports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/forecast/forecast_bloc.dart';
import '../blocs/settings/settings_bloc.dart';
import '../widgets/forecast/forecast_list.dart';

class ForecastScreen extends StatefulWidget {
  const ForecastScreen({Key? key}) : super(key: key);

  @override
  _ForecastScreenState createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  late SettingsBloc _settingsBloc;

  @override
  void initState() {
    super.initState();
    _settingsBloc = BlocProvider.of<SettingsBloc>(context);
    BlocProvider.of<ForecastBloc>(context).add(
      GetWeatherForecastEvent(selPlace: _settingsBloc.state.settings.selPlace!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        titleText: AppLocalizations.of(context)!.weather_forecast,
      ),
      backgroundColor: AppColors.grey1,
      body: const ForecastList(),
    );
  }
}
