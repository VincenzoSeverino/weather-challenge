import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/Model/weather_data.dart';
import 'package:weather_app/Providers/weather_provider.dart';

import 'package:weather_app/Screen/main_screen.dart';
import 'package:weather_app/Utils/weather_api.dart';
import 'package:weather_app/main.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  late Future<WeatherData> featureWeatherData;

  @override
  void initState() {
    // featureWeatherData = WeatherAPI().fetch;
    // weatherFetchCurrentData(ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const String title = 'Current Weather';

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        elevation: 0.0, //Theme.of(context).colorScheme.primary,
        title: Text(
          title,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
        ),
      ),
      body: MainScreen(),
    );
  }
}
