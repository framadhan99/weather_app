import 'package:flutter/material.dart';
import 'package:weather_app/core/helpers/location_helper.dart';
import '../../models/weather_response.dart';
import '../../repositories/weather_repository.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherProvider() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      init();
    });
  }

  WeatherResponse? weather;
  bool isLoading = false;
  String? errorMessage;
  String? getCity;

  Future<void> init() async {
    try {
      isLoading = true;

      final position = await LocationHelper.determinePosition();
      getCity = await LocationHelper.getCityName(
        position.latitude,
        position.longitude,
      );
      notifyListeners();
      await getWeather(lat: position.latitude, lon: position.longitude);
    } catch (e) {
      errorMessage = 'Gagal mendapatkan lokasi: $e';
      debugPrint(errorMessage);
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getWeather({required double lat, required double lon}) async {
    try {
      final res = await WeatherRepository.getWeather(lat: lat, lon: lon);
      weather = res;
      errorMessage = null;
    } catch (e) {
      errorMessage = 'Gagal memuat data cuaca: $e';
      debugPrint(errorMessage);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
