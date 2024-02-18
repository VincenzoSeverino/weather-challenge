import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/Model/weather_data.dart';

import 'package:weather_app/Utils/weather_api.dart';

final weatherApi = Provider<WeatherAPI>((ref) => WeatherAPI());

final weatherDataProvider = FutureProvider<WeatherData>((ref) async {
  return ref.watch(weatherApi).getFetch();
});
