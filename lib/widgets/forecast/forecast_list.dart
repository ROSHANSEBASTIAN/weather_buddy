import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_buddy/widgets/common/empty_component.dart';
import 'package:weather_buddy/widgets/forecast/forecast_list_item.dart';

import '../../utils/log.dart';
import '../../blocs/forecast/forecast_bloc.dart';
import '../../utils/basic_imports.dart';

class ForecastList extends StatelessWidget {
  const ForecastList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForecastBloc, ForecastState>(
      builder: (context, state) {
        if (state is ForecastDataLoaded) {
          final forecastListInfo = state.forecast.forecast!.forecastday!;
          Log.forecastLog("Receved forecast list $forecastListInfo");

          return ListView.builder(
            itemCount: forecastListInfo.length,
            itemBuilder: (context, index) {
              final dayForecast = forecastListInfo[index];
              return SizedBox(
                child: ForecastListItem(dayForecast: dayForecast),
              );
            },
          );
        } else if (state is ForecastDataLoading) {
          return EmptyComponent(
            loading: state.loading,
            isAList: true,
            loadingText: AppLocalizations.of(context)!.loading_forecast,
          );
        } else if (state is ForecastDataLoadError) {
          return EmptyComponent(
            loading: false,
            isAList: true,
            error: state.error,
          );
        } else {
          return EmptyComponent(
            loading: false,
            isAList: true,
            emptyText: AppLocalizations.of(context)!.no_forecast_data_found,
          );
        }
      },
    );
  }
}
