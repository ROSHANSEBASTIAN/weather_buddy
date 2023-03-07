import '../../utils/basic_imports.dart';

import '../../constants/enums.dart';
import '../../models/sports/cricket.dart';
import '../../models/sports/football.dart';
import '../../widgets/sports/sports_events_list_item.dart';

class SportsListItem extends StatelessWidget {
  SportsType sportsType;
  List<Football>? footballInfo;
  List<Cricket>? cricketInfo;
  List<dynamic>? golfInfo;
  final String title;

  SportsListItem({
    Key? key,
    required this.sportsType,
    required this.title,
    this.footballInfo,
    this.cricketInfo,
    this.golfInfo,
  }) : super(key: key);

  Iterable<SportsEventsListItem> renderListItems(List<dynamic> itemsList) {
    if (itemsList.isNotEmpty) {
      return itemsList.map(
        (item) => SportsEventsListItem(
          country: item.country!,
          match: item.match!,
          region: item.region!,
          stadium: item.stadium!,
          start: item.start!,
          tournament: item.tournament!,
          isListEmpty: false,
        ),
      );
    } else {
      return [1].map(
        (item) => const SportsEventsListItem(
          isListEmpty: true,
          country: "",
          match: "",
          region: "",
          stadium: "",
          start: "",
          tournament: "",
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (sportsType == SportsType.cricket) {
      return SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              title,
              style: AppStyles.h2.copyWith(color: AppColors.white),
            ),
            ...renderListItems(cricketInfo as List<Cricket>),
          ],
        ),
      );
    } else if (sportsType == SportsType.football) {
      return SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              title,
              style: AppStyles.h2.copyWith(color: AppColors.white),
            ),
            ...renderListItems(footballInfo as List<Football>),
          ],
        ),
      );
    } else if (sportsType == SportsType.golf) {
      return SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              title,
              style: AppStyles.h2.copyWith(color: AppColors.white),
            ),
            ...renderListItems(golfInfo as List<dynamic>),
          ],
        ),
      );
    } else {
      return const SizedBox(
        height: 0,
        width: 0,
      );
    }
  }
}
