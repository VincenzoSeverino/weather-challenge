import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_animation/weather_animation.dart';

import 'package:weather_app/Providers/weather_provider.dart';
import 'package:weather_app/Widget/current_weather.dart';
import 'package:weather_app/Widget/daily_widget.dart';
import 'package:weather_app/Widget/hourly_weather.dart';

class MainScreen extends StatefulWidget {
  @override
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

// widget.data!.current.weathercode
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final weatherData = ref.watch(weatherDataProvider);
      return weatherData.when(
        loading: () =>
            const SafeArea(child: CircularProgressIndicator.adaptive()),
        error: (Object error, StackTrace stackTrace) => const SizedBox.shrink(),
        data: (data) => Stack(children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: WeatherSceneWidget(
                weatherScene: setScene(data.current.weathercode)),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Container(
                color: const Color.fromARGB(0, 173, 217, 244),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 220, child: CurrentWeather()),
                    const Center(
                      child: Text("Hourly Weather"),
                    ),
                    const SizedBox(
                      height: 200,
                      child: HourlyWeather(),
                    ),
                    DailyWeather(),
                  ],
                ),
              ),
            ),
          ),
        ]),
      );
    });
  }

  WeatherScene setScene(int code) {
    switch (code) {
      case 0: //	Clear sky
        return WeatherScene.sunset;
      case 1 || 2 || 3: //Mainly clear, partly cloudy, and overcast
        return WeatherScene.weatherEvery;
      case 45 || 48: // Fog and depositing rime fog
        return WeatherScene.scorchingSun;
      case 51 || 53 || 55: //Drizzle: Light, moderate, and dense intensity
        return WeatherScene.weatherEvery;
      case 56 || 57: //Freezing Drizzle: Light and dense intensity
        return WeatherScene.scorchingSun;
      case 61 || 63 || 65: //Rain: Slight, moderate and heavy intensityy
        return WeatherScene.rainyOvercast;
      case 66 || 67: //	Freezing Rain: Light and heavy intensity
        return WeatherScene.rainyOvercast;
      case 71 || 73 || 75: //Rain: Slight, moderate and heavy intensityy
        return WeatherScene.rainyOvercast;
      case 77: //Snow grains
        return WeatherScene.snowfall;
      case 80 || 81 || 82: //Rain showers: Slight, moderate, and violent
        return WeatherScene.stormy;
      case 85 || 86: //Snow showers slight and heavy
        return WeatherScene.showerSleet;
      case 95: //	Thunderstorm: Slight or moderate
        return WeatherScene.stormy;
      case 96 || 99: //Thunderstorm with slight and heavy hail
        return WeatherScene.stormy;

      default:
        return WeatherScene.sunset;
    }
  }
}
