import 'package:weather_buddy/models/weather_forecast/forecastday.dart';
import 'package:weather_buddy/utils/log.dart';

import '../../utils/basic_imports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/common/empty_component.dart';
import '../../widgets/forecast/forecast_list_item.dart';
import '../../blocs/forecast/forecast_bloc.dart';

class ForecastList extends StatefulWidget {
  const ForecastList({Key? key}) : super(key: key);

  @override
  State<ForecastList> createState() => _ForecastListState();
}

class _ForecastListState extends State<ForecastList> {
  List<Widget> widgetList = [];

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  void populateWIdgetList(List<Forecastday> list) {

    Future future = Future(() {});
    list.forEach((forecast) {
      future = future.then((_) {
        return Future.delayed(
          const Duration(milliseconds: 90),
          () {
            widgetList.add(ForecastListItem(dayForecast: forecast));
            _listKey.currentState!.insertItem(widgetList.length - 1);
          },
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ForecastBloc, ForecastState>(
          builder: (context, state) {
            if (state is ForecastDataLoaded) {
              final forecastListInfo = state.forecast.forecast!.forecastday!;
              populateWIdgetList(forecastListInfo);

              return Expanded(
                child: AnimatedList(
                  key: _listKey,
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  initialItemCount: widgetList.length,
                  itemBuilder: (context, index, animation) {
                    return SizeTransition(
                      sizeFactor: animation,
                      child: widgetList[index],
                    );
                  },
                ),
              );
            } else if (state is ForecastDataLoading) {
              return EmptyComponent(
                loading: true,
                isAList: true,
                loadingText: AppLocalizations.of(context)!.loading_forecast,
                loadingColor: AppColors.grey5,
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
        ),
      ],
    );
  }
}
