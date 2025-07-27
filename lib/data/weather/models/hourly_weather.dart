import 'package:intl/intl.dart';
import 'package:weather_app/data/weather/models/weather.dart';

class HourlyWeather {
  final int dt;
  final double temp;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double uvi;
  final int clouds;
  final int visibility;
  final double windSpeed;
  final int windDeg;
  final double windGust;
  final List<Weather> weather;
  final double pop;

  HourlyWeather({
    required this.dt,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.pop,
  });

  // Getter from minute
  String get minute {
    final date = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
    return DateFormat.Hm().format(date);
  }

  factory HourlyWeather.fromJson(Map<String, dynamic> json) {
    return HourlyWeather(
      dt: json['dt'],
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
      pressure: json['pressure'],
      humidity: json['humidity'],
      dewPoint: (json['dew_point'] as num).toDouble(),
      uvi: (json['uvi'] as num).toDouble(),
      clouds: json['clouds'],
      visibility: json['visibility'],
      windSpeed: (json['wind_speed'] as num).toDouble(),
      windDeg: json['wind_deg'],
      windGust: (json['wind_gust'] as num).toDouble(),
      pop: (json['pop'] as num).toDouble(),
      weather: (json['weather'] as List)
          .map((e) => Weather.fromJson(e))
          .toList(),
    );
  }
}
