import '../../utils/basic_imports.dart';

class SportsEventsListItem extends StatelessWidget {
  final String stadium;
  final String country;
  final String region;
  final String tournament;
  final String start;
  final String match;
  final bool isListEmpty;

  const SportsEventsListItem({
    Key? key,
    required this.stadium,
    required this.country,
    required this.region,
    required this.tournament,
    required this.match,
    required this.start,
    required this.isListEmpty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isListEmpty) {
      return Card(
        clipBehavior: Clip.hardEdge,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                match,
                style: AppStyles.h2,
              ),
              const SizedBox(height: 15),
              Text(
                tournament,
                style: AppStyles.p2,
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Text(country),
                  const SizedBox(width: 10),
                  Text(stadium),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                start,
                style: AppStyles.p2,
              ),
            ],
          ),
        ),
      );
    } else {
      return SizedBox(
        height: 100,
        width: double.infinity,
        child: Center(
          child: Text(AppLocalizations.of(context)!.no_data_found),
        ),
      );
    }
  }
}
