import 'dart:convert' as convert;
import 'dart:ffi';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:weather_app/Model/current.dart';
import 'package:weather_app/Model/daily.dart';
import 'package:weather_app/Model/hourly.dart';

class WeatherData {
  final Current current;
  final Hourly hourly;
  final Daily daily;

  const WeatherData({
    required this.current,
    required this.hourly,
    required this.daily,
  });
}
