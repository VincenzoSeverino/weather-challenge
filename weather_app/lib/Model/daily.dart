class Daily {
  final List<DateTime?> time;
  final List<double?> temperature2mMax;
  final List<num?> temperature2mMin;
  final List<num?> weathercode;

  const Daily({
    required this.time,
    required this.temperature2mMax,
    required this.temperature2mMin,
    required this.weathercode,
  });

  factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(
      time: (json['daily']['time'] as List<dynamic>)
          .map((e) => DateTime.parse(e as String))
          .toList(),
      temperature2mMax: (json['daily']['temperature_2m_max'] as List<dynamic>)
          .map((e) => double.parse(e.toString()))
          .toList(),
      temperature2mMin:
          ((json['daily']['temperature_2m_min'] ?? []) as List<dynamic>)
              .map((e) => e as num)
              .toList(),
      weathercode: ((json['daily']['weathercode'] ?? []) as List<dynamic>)
          .map((e) => num.parse(e.toString()))
          .toList(),
    );
  }
}
