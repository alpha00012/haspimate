import 'package:flutter/material.dart';
import 'package:haspi_mate_ras/screens/home/home_screen.dart';
import 'package:haspi_mate_ras/screens/map/map_screen.dart';
import 'package:haspi_mate_ras/screens/robotrecyclestats/robotrecyclestats_screen.dart';
import 'package:haspi_mate_ras/screens/sittings/sittings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SRP Challenge',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/map': (context) => const RobotTrackingScreen(),
        '/robotrecyclestats': (context) => const RobotRecycleStatsScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );
      },
    );
  }
}
