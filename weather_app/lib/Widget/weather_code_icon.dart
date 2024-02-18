import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherCodeIcon extends StatelessWidget {
  final int weathercode;
  const WeatherCodeIcon({
    super.key,
    required this.weathercode,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        width: 40,
        _setIcon(),
      ),
    );
  }

  String _setIcon() {
    String pathIcon = 'assets/images/icon/weather-sunny-32-regular.svg';

    if (weathercode > 44) {
      //nuvoloso
      pathIcon = 'assets/images/icon/weather-drizzle-24-regular.svg';
    } else if (weathercode > 60) {
      //pioggia
      pathIcon = 'assets/images/icon/weather-rainy.svg';
    } else if (weathercode > 70) {
      //neve
      pathIcon = 'assets/images/icon/weather-snowy-outline.svg';
    }

    return pathIcon;
  }
}
