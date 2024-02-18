class Current {
  final double temperature2m;
  final int relativehumidity2m;
  final double apparentTemperature;
  final int weathercode;

  const Current({
    required this.temperature2m,
    required this.relativehumidity2m,
    required this.apparentTemperature,
    required this.weathercode,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      temperature2m: json['current']['temperature_2m'] ?? 0,
      relativehumidity2m: json['current']['relativehumidity_2m'] ?? 0,
      apparentTemperature: json['current']['apparent_temperature'] ?? 0,
      weathercode: json['current']['weathercode'] ?? 0.0,
    );
  }
}
