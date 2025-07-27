import '../../../core/helpers/api_base_helper.dart';
import '../../../core/helpers/key_helper.dart';
import '../../../core/helpers/log_helper.dart';
import '../models/response_data.dart';
import '../models/weather_response.dart';

class WeatherRepository {
  static final ApiBaseHelper _helper = ApiBaseHelper();

  static Future<WeatherResponse?> getWeather({
    required double lat,
    required double lon,
  }) async {
    final apiKey = await ApiKeyProvider.getApiKey();
    String endpoint = '/onecall';
    final Map<String, dynamic> params = {
      'lat': lat.toString(),
      'lon': lon.toString(),
      // 'exclude': 'hourly',
      'appid': apiKey,
      'units': 'metric',
    };
    ResponseData? responseData;

    try {
      responseData = await _helper.get(url: endpoint, data: params);
      if (responseData.code == 200) {
        return WeatherResponse.fromJson(responseData.data);
      }
    } catch (error) {
      throw loge(
        error: error,
        endpoint: endpoint,
        method: Method.get, // ✅ Ganti ke GET
        responseData: responseData,
        params: params,
      );
    }
    return null;
  }
}
