import 'package:flutter/material.dart';
import 'package:weather_buddy/screens/home_screen.dart';

// route names
const String homeScreen = "homeScreen";
const String sportsScreen = "sportsScreen";
const String forecastScreen = "forecastScreen";
const String weatherHistoryScreen = "weatherHistoryScreen";

// route table
Map<String, Widget Function(BuildContext context)> routeConfig = {
  homeScreen: (BuildContext context) => const HomeScreen(),
  sportsScreen: (BuildContext context) => const HomeScreen(),
};
