import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/Screen/main_screen.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Widget/weather_code_icon.dart';

class HourlyWeather extends StatelessWidget {
  HourlyWeather({
    super.key,
    required this.widget,
  });

  final MainScreen widget;

  final formatter = DateFormat.Hm();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(12),
          itemCount: widget.data?.hourly.time.length ?? 24,
          separatorBuilder: (context, index) {
            return SizedBox(width: 12);
          },
          itemBuilder: (context, index) {
            var time = formatter.format(widget.data!.hourly.time[index]!);
            var temperature_2m =
                widget.data?.hourly.temperature_2m[index].toString();
            var weathercode = widget.data?.hourly.weathercode[index];
            var relativehumidity_2m =
                widget.data?.hourly.relativehumidity_2m[index].toString();
            var textStyle =
                TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
            return Material(
              elevation: 10,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Container(
                width: 150,
                height: 140,
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(100, 223, 222, 226),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(time ?? '--', style: textStyle),
                    WeatherCodeIcon(weathercode: weathercode!.toInt() ?? 0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(temperature_2m ?? '--', style: textStyle),
                        Text('C°', style: textStyle),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(relativehumidity_2m ?? '--', style: textStyle),
                        Text('%', style: textStyle),
                        SvgPicture.asset(
                          'assets/images/icon/water-precipitation-weather.svg',
                        ),
                      ],
                    ),
                  ],
                )),
              ),
            );
          }),
    );
  }
}
