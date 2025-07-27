import 'package:intl/intl.dart';

import 'weather.dart';

class CurrentWeather {
  final int dt;
  final double temp;
  final double feelsLike;
  final int humidity;
  final int pressure;
  final int clouds;
  final int visibility;
  final double windSpeed;
  final List<Weather> weather;

  CurrentWeather({
    required this.dt,
    required this.temp,
    required this.feelsLike,
    required this.humidity,
    required this.pressure,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.weather,
  });

  // Getter from name day
  String get dayName {
    final date = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
    return DateFormat('EE, d MMMM').format(date);
  }

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      dt: json['dt'],
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
      humidity: json['humidity'],
      pressure: json['pressure'],
      clouds: json['clouds'],
      visibility: json['visibility'],
      windSpeed: (json['wind_speed'] as num).toDouble(),
      weather: (json['weather'] as List)
          .map((e) => Weather.fromJson(e))
          .toList(),
    );
  }
}
