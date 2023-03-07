import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_buddy/constants/enums.dart';
import 'package:weather_buddy/models/sports/sports.dart';
import 'package:weather_buddy/utils/log.dart';
import 'package:weather_buddy/widgets/sports/sports_list_item.dart';

import '../../blocs/sports/sports_bloc.dart';
import '../../widgets/common/empty_component.dart';
import '../../utils/basic_imports.dart';

class SportsList extends StatelessWidget {
  const SportsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SportsBloc, SportsState>(
      builder: (context, state) {
        if (state is SportsDataLoaded) {
          return ListView(
            children: [
              const SizedBox(height: 10),
              SportsListItem(
                title: "Football",
                footballInfo: state.sportsInfo.football,
                sportsType: SportsType.football,
              ),
              const SizedBox(height: 10),
              SportsListItem(
                title: "Cricket",
                cricketInfo: state.sportsInfo.cricket,
                sportsType: SportsType.cricket,
              ),
              const SizedBox(height: 10),
              SportsListItem(
                title: "Golf",
                golfInfo: state.sportsInfo.golf,
                sportsType: SportsType.golf,
              ),
            ],
          );
        }
        if (state is SportsDataLoading) {
          return EmptyComponent(
            loading: true,
            isAList: true,
            loadingText: AppLocalizations.of(context)!.loading_sports_events,
          );
        } else if (state is SportsDataLoadError) {
          return EmptyComponent(
            loading: false,
            isAList: true,
            error: state.error,
          );
        } else {
          return EmptyComponent(loading: false, isAList: true);
        }
      },
    );
  }
}
