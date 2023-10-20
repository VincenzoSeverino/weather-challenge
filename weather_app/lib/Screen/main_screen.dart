import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/Model/weather_data.dart';

import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:weather_app/Widget/current_weather.dart';
import 'package:weather_app/Widget/hourly_weather.dart';
import 'package:weather_app/Widget/daily_widget.dart';

class MainScreen extends StatefulWidget {
  late WeatherData? data;
  @override
  MainScreen({
    super.key,
    WeatherData? this.data,
  });

  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CurrentWeather(widget: widget),
            const Center(
              child: Text("Hourly Weather"),
            ),
            HourlyWeather(
              widget: widget,
            ),
            DailyWeather(
              widget: widget,
            ),
          ],
        ),
      ),
    );
  }
}
