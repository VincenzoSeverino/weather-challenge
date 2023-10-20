class Daily {
  final List<DateTime?> time;
  final List<double?> temperature_2m_max;
  final List<num?> temperature_2m_min;
  final List<num?> weathercode;

  const Daily({
    required this.time,
    required this.temperature_2m_max,
    required this.temperature_2m_min,
    required this.weathercode,
  });

  factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(
      time: (json['daily']['time'] as List<dynamic>)!
          .map((e) => DateTime.parse(e as String))
          .toList(),
      temperature_2m_max: (json['daily']['temperature_2m_max'] as List<dynamic>)
          .map((e) => double.parse(e.toString()))
          .toList(),
      temperature_2m_min:
          ((json['daily']['temperature_2m_min'] ?? []) as List<dynamic>)!
              .map((e) => e as num)
              .toList(),
      weathercode: ((json['daily']['weathercode'] ?? []) as List<dynamic>)!
          .map((e) => num.parse(e.toString()))
          .toList(),
    );
  }
}
