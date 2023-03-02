import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_buddy/blocs/forecast/forecast_bloc.dart';
import 'package:weather_buddy/blocs/place_bloc/place_bloc_bloc.dart';
import 'package:weather_buddy/blocs/weather/weather_bloc.dart';
import 'package:weather_buddy/constants/styles.dart';
import 'package:weather_buddy/models/place/place.dart';
import 'package:weather_buddy/utils/log.dart';
import 'package:weather_buddy/widgets/forecast/forecast_list.dart';

import '../utils/screen_imports.dart';

class ForecastScreen extends StatefulWidget {
  const ForecastScreen({Key? key}) : super(key: key);

  @override
  _ForecastScreenState createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  late PlaceBlocBloc _placeBloc;

  @override
  void initState() {
    super.initState();
    _placeBloc = BlocProvider.of<PlaceBlocBloc>(context);
    BlocProvider.of<ForecastBloc>(context).add(
      GetWeatherForecastEvent(selPlace: _placeBloc.state.selPlace),
    );
  }

  // callbacks and functions
  Future<void> _loadForecastInfo(Place selPlace) async {
    Log.forecastLog("Selected place is $selPlace");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        titleText: AppLocalizations.of(context)!.weather_forecast,
      ),
      body: Container(
        decoration: AppStyles.decorationGradient1,
        child: const ForecastList(),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      ),
    );
  }
}
