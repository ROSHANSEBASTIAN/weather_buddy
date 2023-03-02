import 'package:weather_buddy/screens/forecast_screen.dart';
import 'package:weather_buddy/screens/home_screen.dart';

import '../utils/basic_imports.dart';

class HomeBottomTabs extends StatefulWidget {
  const HomeBottomTabs({Key? key}) : super(key: key);

  @override
  _HomeBottomTabsState createState() => _HomeBottomTabsState();
}

class _HomeBottomTabsState extends State<HomeBottomTabs> {
  // states
  int _selIndex = 0;

  // screens
  final _screens = [
    const HomeScreen(),
    const ForecastScreen(),
  ];

  // callbacks
  void _tabHandler(int index) {
    setState(() {
      _selIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.sunny),
            label: AppLocalizations.of(context)!.forecast,
          ),
        ],
        onTap: _tabHandler,
        currentIndex: _selIndex,
      ),
    );
  }
}
