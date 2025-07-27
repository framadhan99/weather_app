import 'package:weather_app/data/weather/models/hourly_weather.dart';

import 'current_weather.dart';
import 'daily_weather.dart';
import 'minutely_weather.dart';
import 'weather_alert.dart';

class WeatherResponse {
  final double lat;
  final double lon;
  final String timezone;
  final CurrentWeather current;
  final List<MinutelyWeather>? minutely;
  final List<WeatherAlert>? alerts;
  final List<DailyWeather>? daily;
  final List<HourlyWeather>? hourly;

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return WeatherResponse(
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      timezone: json['timezone'] ?? '',
      current: CurrentWeather.fromJson(json['current']),
      minutely: (json['minutely'] as List?)
          ?.map((e) => MinutelyWeather.fromJson(e))
          .toList(),
      alerts: (json['alerts'] as List?)
          ?.map((e) => WeatherAlert.fromJson(e))
          .toList(),
      daily: (json['daily'] as List?)
          ?.map((e) => DailyWeather.fromJson(e))
          .toList(),
      hourly: (json['hourly'] as List?)
          ?.map((e) => HourlyWeather.fromJson(e))
          .toList(),
    );
  }

  WeatherResponse({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.current,
    required this.minutely,
    required this.alerts,
    required this.daily,
    required this.hourly,
  });
}
