import 'package:flutter/material.dart';
import 'package:weather_app/Widget/weather_code_icon.dart';

class DailyWidgetElement extends StatelessWidget {
  const DailyWidgetElement({
    super.key,
    required this.time,
    required this.weathercode,
    required this.temperature2mMax,
    required this.temperature2mMin,
  });

  final String time;
  final num? weathercode;
  final String temperature2mMax;
  final String temperature2mMin;

  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500);
    return Container(
      height: 40,
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 40,
            child: Text(time, style: textStyle),
          ),
          WeatherCodeIcon(weathercode: weathercode?.toInt() ?? 0),
          Text("$temperature2mMax C° - $temperature2mMin C°", style: textStyle),
        ],
      ),
    );
  }
}
