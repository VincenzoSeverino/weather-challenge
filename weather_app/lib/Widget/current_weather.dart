import 'package:flutter/material.dart';
import 'package:weather_app/Screen/main_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/Widget/weather_code_icon.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({
    super.key,
    required this.widget,
  });

  final MainScreen widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Container(
          padding: EdgeInsets.all(30),
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 202, 196, 206),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Text(
                          widget.data?.current.temperature_2m.toString() ?? '-',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.w700)),
                      Text('C°',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.w700)),
                    ],
                  ),
                  WeatherCodeIcon(
                      weathercode: widget.data!.current.weathercode),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Temperatura percepita  ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                  Text(
                      widget.data?.current.apparent_temperature.toString() ??
                          '0',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      widget.data?.current.relativehumidity_2m.toString() ??
                          '-',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  Text("%",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  SvgPicture.asset(
                    'assets/images/icon/water-precipitation-weather.svg',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
