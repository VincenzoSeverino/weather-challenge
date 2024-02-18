import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:weather_app/Model/hourly.dart';
import 'package:weather_app/Providers/weather_provider.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Widget/hourly_widget_element.dart';

class HourlyWeather extends ConsumerStatefulWidget {
  const HourlyWeather({
    super.key,
  });

  @override
  createState() => HourlyWeatherState();
}

class HourlyWeatherState extends ConsumerState<HourlyWeather> {
  final formatter = DateFormat.Hm();

  final ItemScrollController _ctr = ItemScrollController();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    // WidgetsBinding.instance?.addPostFrameCallback((_) {
    //   // do something
    // });
  }

  @override
  Widget build(BuildContext context) {
    final weatherData = ref.watch(weatherDataProvider)
      ..whenData((value) => WidgetsBinding.instance.addPostFrameCallback((_) {
            // do something

            _ctr.scrollTo(
                index: DateTime.now().hour,
                duration: const Duration(milliseconds: 1000),
                curve: Curves.bounceIn);
          }));
    return weatherData.maybeWhen(
        data: (data) => hourlyElementsRow(data.hourly),
        orElse: () => const SizedBox.shrink());
  }

  Widget hourlyElementsRow(Hourly hourlyData) {
    return Container(
      color: Colors.transparent,
      height: 210,
      child: ScrollablePositionedList.separated(
          itemScrollController: _ctr,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(12),
          itemCount: 24,
          separatorBuilder: (context, index) {
            return const SizedBox(width: 12);
          },
          itemBuilder: (context, index) {
            return HourlyWidgetElement(
                time: formatter.format(hourlyData.time[index]!),
                weathercode: hourlyData.weathercode[index]!,
                temperature_2m: hourlyData.temperature2m[index].toString(),
                relativehumidity_2m:
                    hourlyData.relativehumidity2m[index].toString());
          }),
    );
  }
}
