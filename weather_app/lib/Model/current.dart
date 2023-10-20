class Current {
  final double temperature_2m;
  final int relativehumidity_2m;
  final double apparent_temperature;
  final int weathercode;

  const Current({
    required this.temperature_2m,
    required this.relativehumidity_2m,
    required this.apparent_temperature,
    required this.weathercode,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      temperature_2m: json['current']['temperature_2m'] ?? 0,
      relativehumidity_2m: json['current']['relativehumidity_2m'] ?? 0,
      apparent_temperature: json['current']['apparent_temperature'] ?? 0,
      weathercode: json['current']['weathercode'] ?? 0.0,
    );
  }
}
