import 'package:flutter/material.dart';
import 'package:weather_app/Widget/weather_code_icon.dart';

class DailyWidgetElement extends StatelessWidget {
  const DailyWidgetElement({
    super.key,
    required this.time,
    required this.weathercode,
    required this.temperature_2m_max,
    required this.temperature_2m_min,
  });

  final String time;
  final num? weathercode;
  final String? temperature_2m_max;
  final String? temperature_2m_min;

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500);
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            child: Text(time, style: textStyle),
            width: 40,
          ),
          WeatherCodeIcon(weathercode: weathercode!.toInt()),
          Text("$temperature_2m_max C° - $temperature_2m_min C°",
              style: textStyle),
        ],
      ),
    );
  }
}
