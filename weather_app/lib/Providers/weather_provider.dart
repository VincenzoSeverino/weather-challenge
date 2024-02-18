import 'dart:developer';

import 'package:riverpod/riverpod.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/Model/current.dart';
import 'package:weather_app/Model/daily.dart';
import 'package:weather_app/Model/hourly.dart';
import 'package:weather_app/Model/weather_data.dart';

import 'dart:convert' as convert;

import 'package:weather_app/Utils/weather_api.dart';

final weatherApi = Provider<WeatherAPI>((ref) => WeatherAPI());

final weatherDataProvider = FutureProvider<WeatherData>((ref) async {
  return ref.watch(weatherApi).getFetch();
});
