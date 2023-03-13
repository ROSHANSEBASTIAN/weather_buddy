import 'package:flutter/material.dart';
import 'package:weather_buddy/screens/map_selection_screen.dart';

import '../navigation/home_bottom_tabs.dart';
import '../screens/sports_screen.dart';
import '../screens/location_selection_screen.dart';
import '../screens/home_screen.dart';
import '../screens/astronomy_screen.dart';

// route names
const String homeTabs = "homeTabs";
const String homeScreen = "homeScreen";
const String sportsScreen = "sportsScreen";
const String forecastScreen = "forecastScreen";
const String weatherHistoryScreen = "weatherHistoryScreen";
const String placePickerScreen = "placePickerScreen";
const String astronomyScreen = "astronomyScreen";
const String mapSelectionScreen = "mapSelectionScreen";

// route table
Map<String, Widget Function(BuildContext context)> routeConfig = {
  homeScreen: (BuildContext context) => const HomeScreen(),
  placePickerScreen: (BuildContext context) => LocationSelectionScreen(),
  homeTabs: (BuildContext context) => const HomeBottomTabs(),
  sportsScreen: (BuildContext context) => const SportsScreen(),
  astronomyScreen: (BuildContext context) => const AstronomyScreen(),
  mapSelectionScreen: (BuildContext context) => const MapSelectionScreen(),
};
