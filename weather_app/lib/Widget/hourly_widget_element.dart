import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/Widget/weather_code_icon.dart';

class HourlyWidgetElement extends StatelessWidget {
  const HourlyWidgetElement({
    super.key,
    required this.time,
    required this.weathercode,
    required this.temperature_2m,
    required this.relativehumidity_2m,
  });

  final String? time;
  final num? weathercode;
  final String? temperature_2m;
  final String? relativehumidity_2m;
  final TextStyle textStyle = const TextStyle(
      color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500);
  final TextStyle textStyleBlack = const TextStyle(
      color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      //borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Container(
        width: 150,
        height: 140,
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
            backgroundBlendMode: BlendMode.darken,
            color: Color.fromARGB(120, 193, 194, 194),
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
                Text(temperature_2m ?? '--' + ' C°', style: textStyle),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(relativehumidity_2m ?? '--', style: textStyleBlack),
                Text('%', style: textStyleBlack),
                SvgPicture.asset(
                  'assets/images/icon/water-precipitation-weather.svg',
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
