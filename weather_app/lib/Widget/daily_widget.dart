import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/Screen/main_screen.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Widget/daily_widget_element.dart';
import 'package:weather_app/Widget/weather_code_icon.dart';

class DailyWeather extends StatelessWidget {
  DailyWeather({
    super.key,
    required this.widget,
  });

  final MainScreen widget;

  final formatter = DateFormat.E();

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
                color: Color.fromARGB(200, 71, 108, 155),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: setElement(),
            )),
      ),
    );
  }

  List<Widget> setElement() {
    List<Widget> list = List.generate(widget.data!.daily.time.length, (index) {
      var time = formatter.format(widget.data!.daily.time[index]!);
      var weathercode = widget.data?.daily.weathercode[index];
      var temperature_2m_max =
          widget.data?.daily.temperature_2m_max[index].toString();
      var temperature_2m_min =
          widget.data?.daily.temperature_2m_min[index].toString();

      return DailyWidgetElement(
          time: time,
          weathercode: weathercode,
          temperature_2m_max: temperature_2m_max,
          temperature_2m_min: temperature_2m_min);
    });

    return list;
  }
}
