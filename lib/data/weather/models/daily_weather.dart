import 'package:intl/intl.dart';
import 'package:weather_app/data/weather/models/hourly_weather.dart';
import 'package:weather_app/data/weather/models/weather.dart';

class DailyWeather {
  final int dt;
  final Temp temp;
  final List<Weather> weather;

  DailyWeather({required this.dt, required this.temp, required this.weather});

  // Getter from name day
  String get dayName {
    final date = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
    return DateFormat('EEEE').format(date);
  }

  factory DailyWeather.fromJson(Map<String, dynamic> json) {
    return DailyWeather(
      dt: json['dt'],
      temp: Temp.fromJson(json['temp']),
      weather: (json['weather'] as List)
          .map((e) => Weather.fromJson(e))
          .toList(),
    );
  }
}

class Temp {
  final double day;
  final double min;
  final double max;

  Temp({required this.day, required this.min, required this.max});

  factory Temp.fromJson(Map<String, dynamic> json) {
    return Temp(
      day: (json['day'] as num).toDouble(),
      min: (json['min'] as num).toDouble(),
      max: (json['max'] as num).toDouble(),
    );
  }
}
