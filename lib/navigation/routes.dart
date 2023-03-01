import 'package:flutter/material.dart';

import '../screens/location_selection_screen.dart';
import '../screens/home_screen.dart';

// route names
const String homeScreen = "homeScreen";
const String sportsScreen = "sportsScreen";
const String forecastScreen = "forecastScreen";
const String weatherHistoryScreen = "weatherHistoryScreen";
const String placePickerScreen = "placePickerScreen";

// route table
Map<String, Widget Function(BuildContext context)> routeConfig = {
  homeScreen: (BuildContext context) => const HomeScreen(),
  placePickerScreen: (BuildContext context) => LocationSelectionScreen(),
};
