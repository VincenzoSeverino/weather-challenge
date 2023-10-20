class Hourly {
  final List<DateTime?> time;
  final List<double?> temperature_2m;
  final List<num?> relativehumidity_2m;
  final List<num?> weathercode;

  const Hourly({
    required this.time,
    required this.temperature_2m,
    required this.relativehumidity_2m,
    required this.weathercode,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) {
    return Hourly(
      time: (json['hourly']['time'] as List<dynamic>)!
          .map((e) => DateTime.parse(e as String))
          .toList(),
      temperature_2m: (json['hourly']['temperature_2m'] as List<dynamic>)
          .map((e) => double.parse(e.toString()))
          .toList(),
      relativehumidity_2m:
          ((json['hourly']['relativehumidity_2m'] ?? []) as List<dynamic>)!
              .map((e) => e as num)
              .toList(),
      weathercode: ((json['hourly']['weathercode'] ?? []) as List<dynamic>)!
          .map((e) => num.parse(e.toString()))
          .toList(),
    );
  }
}
