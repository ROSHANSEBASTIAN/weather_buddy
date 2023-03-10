import '../../utils/basic_imports.dart';
import '../../navigation/routes.dart';

class HomeHorizontalList extends StatelessWidget {
  const HomeHorizontalList({Key? key}) : super(key: key);

  Widget renderListItem({
    required String title,
    required String image,
    required Function callback,
    required BuildContext context,
  }) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => callback(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Image.asset(
                  image,
                  width: 70,
                  height: 50,
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  title,
                  style: AppStyles.h4,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // callbacks
  void navigateToSportsScreen(BuildContext context) {
    Navigator.of(context).pushNamed(sportsScreen);
  }

  void navigateToAstronomyScreen(BuildContext context) {
    Navigator.of(context).pushNamed(astronomyScreen);
  }

  void navigateToWeatherHistoryScreen(BuildContext context) {
    Navigator.of(context).pushNamed(sportsScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 5, right: 5),
      width: double.infinity,
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          renderListItem(
              title: AppLocalizations.of(context)!.sports,
              image: "assets/images/football-player.png",
              callback: navigateToSportsScreen,
              context: context),
          renderListItem(
            title: AppLocalizations.of(context)!.astronomy,
            image: "assets/images/astronomy.png",
            callback: navigateToAstronomyScreen,
            context: context,
          ),
          renderListItem(
            title: AppLocalizations.of(context)!.weather_history,
            image: "assets/images/history.png",
            callback: navigateToWeatherHistoryScreen,
            context: context,
          ),
        ],
      ),
    );
  }
}
