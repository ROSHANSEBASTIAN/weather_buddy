import '../../utils/basic_imports.dart';
import 'package:rive/rive.dart';

class WeatherAnimated extends StatelessWidget {
  const WeatherAnimated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 400,
      width: double.infinity,
      child: RiveAnimation.asset(
        "assets/rive/weather_icon.riv",
        fit: BoxFit.cover,
      ),
    );
  }
}
