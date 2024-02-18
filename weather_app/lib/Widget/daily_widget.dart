import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/Model/daily.dart';
import 'package:weather_app/Model/weather_data.dart';
import 'package:weather_app/Providers/weather_provider.dart';
import 'package:weather_app/Screen/main_screen.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Utils/weather_api.dart';
import 'package:weather_app/Widget/daily_widget_element.dart';
import 'package:weather_app/Widget/weather_code_icon.dart';

class DailyWeather extends ConsumerWidget {
  DailyWeather({
    super.key,
  });

  final formatter = DateFormat.E();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(weatherDataProvider);
    return weatherData.maybeWhen(
        data: (data) => dailyColumn(data.daily),
        orElse: () => const SizedBox.shrink());
  }

  Container dailyColumn(Daily dailyData) {
    return Container(
      height: 400,
      margin: EdgeInsets.all(20),
      child: Card(
        clipBehavior: Clip.hardEdge,
        color: Colors.transparent,
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Container(
            padding: EdgeInsets.all(30),
            decoration: const BoxDecoration(
                color: Color.fromARGB(20, 71, 108, 155),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: CustomScrollView(
              shrinkWrap: true,
              slivers: setListElement(dailyData),
            )),
      ),
    );
  }

  List<Widget> setListElement(Daily daily) {
    List<Widget> list = List.generate(daily.time.length, (index) {
      return DailyWidgetElement(
          time: formatter.format(daily.time[index]!),
          weathercode: daily.weathercode[index],
          temperature_2m_max: daily.temperature_2m_max[index].toString(),
          temperature_2m_min: daily.temperature_2m_min[index].toString());
    });

    return list;
  }
}
