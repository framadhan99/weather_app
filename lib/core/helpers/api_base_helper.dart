import 'package:dio/dio.dart';
import 'package:weather_app/core/utils/strings.dart';

import '../../data/weather/models/response_data.dart';
import '../utils/custom_snackbar.dart';
import 'helpers.dart';
import 'log_helper.dart';

enum Method { post, get, put, delete, notif }

class ApiBaseHelper {
  Dio init({
    String contentType = "application/json",
    String? customUrl,
    Method? method,
  }) {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: customUrl ?? Strings.baseUrl,
        connectTimeout: const Duration(milliseconds: 30000),
        receiveTimeout: const Duration(milliseconds: 30000),
        headers: {"Content-Type": contentType, "Accept": "application/json"},
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options); //continue
        },
        onResponse: (response, handler) async {
          return handler.next(response); // continue
        },
        onError: (DioException e, handler) async {
          if (e.response?.data['error']['status'] == 401) {
            showInSnackBar("Sesi login anda telah berakhir !");
            return;
          } else {
            try {
              showInSnackBar(e.response?.data["message"]);
            } catch (error) {
              loge(
                error: e,
                endpoint: "${e.response?.realUri}",
                method: method ?? Method.post,
                params: e.requestOptions.queryParameters,
                data: e.requestOptions.data,
              );
            }

            return handler.next(e);
          }
        },
      ),
    );
    return dio;
  }

  Future<ResponseData> get({
    required String url,
    Map<String, dynamic>? data,
  }) async {
    ResponseData responseData = const ResponseData();
    Dio dio = init(method: Method.get);
    try {
      if (!url.startsWith('/')) url = '/$url';
      Response response = await dio.get(url, queryParameters: data);
      responseData = ResponseData(
        code: response.statusCode,
        data: response.data,
        message: response.statusMessage,
      );
      Log.success(response);
    } on DioException catch (error) {
      if (!isEmpty(error.response?.data)) {
        responseData = ResponseData.fromJson(error.response?.data);
        loge(
          error: error,
          endpoint: url,
          method: Method.get,
          params: data,
          responseData: responseData,
        );
      }
    } catch (error) {
      loge(
        error: error,
        endpoint: url,
        method: Method.get,
        params: data,
        responseData: responseData,
      );
    }
    return responseData;
  }
}
