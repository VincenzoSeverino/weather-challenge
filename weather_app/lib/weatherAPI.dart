import 'dart:convert' as convert;
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:weather_app/Model/current.dart';
import 'package:weather_app/Model/daily.dart';
import 'package:weather_app/Model/hourly.dart';
import 'Model/weather_data.dart';
import 'package:geolocator/geolocator.dart';

class WeatherAPI {
  Future<WeatherData> getFetch() async {
    Position position = await _determinePosition();
    log(position.latitude.toString() + " " + position.longitude.toString());
    var latitude = position.latitude ?? 41.9;
    var longitude = position.longitude ?? 12.49;

    final url =
        "https://api.open-meteo.com/v1/dwd-icon?latitude=$latitude&longitude=$longitude&current=temperature_2m,relativehumidity_2m,apparent_temperature,weathercode&hourly=temperature_2m,relativehumidity_2m,apparent_temperature,weathercode&daily=weathercode,temperature_2m_max,temperature_2m_min&timezone=auto";
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 400) {
      throw Exception("connection error");
    }
    if (response.statusCode == 200) {
      String data = response.body;

      return WeatherData(
        current: Current.fromJson(convert.jsonDecode(data)),
        hourly: Hourly.fromJson(convert.jsonDecode(data)),
        daily: Daily.fromJson(convert.jsonDecode(data)),
      );
    } else {
      log(response.statusCode.toString());
      throw Exception("no data");
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
