import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/Model/current.dart';
import 'package:weather_app/Model/weather_data.dart';

import 'package:weather_app/Providers/weather_provider.dart';
import 'package:weather_app/Screen/main_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/Utils/weather_api.dart';
import 'package:weather_app/Widget/weather_code_icon.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      margin: const EdgeInsets.all(20),
      child: Card(
        color: Colors.transparent,
        elevation: 10,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Container(
          padding: EdgeInsets.all(30),
          decoration: const BoxDecoration(
              color: Color.fromARGB(120, 71, 108, 155),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final weatherData = ref.watch(weatherDataProvider);
              return weatherData.maybeWhen(
                  data: (data) => elementDataColumn(data.current),
                  orElse: () => const SizedBox.shrink());
            },
          ),
        ),
      ),
    );
  }

  Column elementDataColumn(Current currentData) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Text('${currentData.temperature_2m} C°' ?? '-',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w700)),
              ],
            ),
            WeatherCodeIcon(weathercode: currentData.weathercode),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Temperatura percepita  ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500)),
            Text(currentData.apparent_temperature.toString() ?? '0',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(currentData.relativehumidity_2m.toString() + "%" ?? '-',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            SvgPicture.asset(
              'assets/images/icon/water-precipitation-weather.svg',
            ),
          ],
        ),
      ],
    );
  }
}
