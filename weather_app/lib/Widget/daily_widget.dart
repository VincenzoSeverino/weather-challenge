import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/Model/daily.dart';
import 'package:weather_app/Providers/weather_provider.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Widget/daily_widget_element.dart';

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
      height: 350,
      margin: const EdgeInsets.all(20),
      child: Card(
        clipBehavior: Clip.hardEdge,
        color: Colors.transparent,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          decoration: const BoxDecoration(
              color: Color.fromARGB(20, 71, 108, 155),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          padding: const EdgeInsets.all(30),
          child: Center(
            child: Column(
              children: setListElement(dailyData),
            ),
          ),
        ),
      ),
    );
    //  Container(
    //   height: 400,
    //   margin: const EdgeInsets.all(20),
    //   child: Card(
    //     clipBehavior: Clip.hardEdge,
    //     color: Colors.transparent,
    //     elevation: 10,
    //     shape: const RoundedRectangleBorder(
    //         borderRadius: BorderRadius.all(Radius.circular(20))),
    //     child: Container(
    //         padding: const EdgeInsets.all(30),
    //         decoration: const BoxDecoration(
    //             color: Color.fromARGB(20, 71, 108, 155),
    //             borderRadius: BorderRadius.all(Radius.circular(20))),
    //         child: CustomScrollView(
    //           shrinkWrap: true,
    //           slivers: setListElement(dailyData),
    //         )),
    //   ),
    // );
  }

  List<Widget> setListElement(Daily daily) {
    List<Widget> list = List.generate(daily.time.length, (index) {
      return DailyWidgetElement(
          time: formatter.format(daily.time[index]!),
          weathercode: daily.weathercode[index],
          temperature2mMax: daily.temperature2mMax[index].toString(),
          temperature2mMin: daily.temperature2mMin[index].toString());
    });

    return list;
  }
}
