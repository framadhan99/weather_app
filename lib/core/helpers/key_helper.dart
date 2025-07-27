import 'dart:developer';

import 'package:flutter/services.dart';

class ApiKeyProvider {
  static const _channel = MethodChannel('weather_api_channel');

  static Future<String?> getApiKey() async {
    try {
      final apiKey = await _channel.invokeMethod<String>('getWeatherApiKey');
      return apiKey;
    } on PlatformException catch (e) {
      log("Failed to get API key: ${e.message}");
      return null;
    }
  }
}
