class MinutelyWeather {
  final int dt;
  final int precipitation;

  MinutelyWeather({required this.dt, required this.precipitation});

  factory MinutelyWeather.fromJson(Map<String, dynamic> json) {
    return MinutelyWeather(
      dt: json['dt'],
      precipitation: json['precipitation'],
    );
  }
}
