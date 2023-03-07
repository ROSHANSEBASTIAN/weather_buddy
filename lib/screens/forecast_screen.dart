import '../utils/screen_imports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/forecast/forecast_bloc.dart';
import '../blocs/place_bloc/place_bloc_bloc.dart';
import '../constants/styles.dart';
import '../widgets/forecast/forecast_list.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        titleText: AppLocalizations.of(context)!.weather_forecast,
      ),
      body: Container(
        decoration: AppStyles.decorationGradient1,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: const ForecastList(),
      ),
    );
  }
}
