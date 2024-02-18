import 'dart:convert' as convert;
import 'dart:ffi';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:weather_app/Model/current.dart';
import 'package:weather_app/Model/daily.dart';
import 'package:weather_app/Model/hourly.dart';

class WeatherData {
  late final Current current;
  late final Hourly hourly;
  late final Daily daily;

  WeatherData({
    required this.current,
    required this.hourly,
    required this.daily,
  });

  setCurrent(Current current) {
    this.current = current;
  }

  setHourly(Hourly hourly) {
    this.hourly = hourly;
  }

  setDaily(Daily daily) {
    this.daily = daily;
  }
}
