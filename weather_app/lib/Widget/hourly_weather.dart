import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/Screen/main_screen.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Widget/hourly_widget_element.dart';
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
          itemCount: 24,
          separatorBuilder: (context, index) {
            return SizedBox(width: 12);
          },
          itemBuilder: (context, index) {
            return HourlyWidgetElement(
                time: formatter.format(widget.data!.hourly.time[index]!),
                weathercode: widget.data!.hourly.weathercode[index]!,
                temperature_2m:
                    widget.data!.hourly.temperature_2m[index].toString(),
                relativehumidity_2m:
                    widget.data!.hourly.relativehumidity_2m[index].toString());
          }),
    );
  }
}
