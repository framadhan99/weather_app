import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../../data/weather/models/response_data.dart';
import '../utils/custom_snackbar.dart';
import 'api_base_helper.dart';

class Log {
  static String appname = "Weather App";
  Log([String? value]) {
    log(value!, name: appname);
  }

  static success(Response response) {
    log(
      "STATUS CODE ${response.statusCode} | ${response.realUri.toString()} (data) => ${jsonEncode(response.data)}",
      name: appname,
    );
  }
}

Exception loge({
  required Object error,
  required String endpoint,
  required Method method,
  ResponseData? responseData,
  Map<String, dynamic>? params,
  Map<String, dynamic>? data,
}) {
  log("Method -> $method");
  String methodString = "";
  String data = "";

  switch (method) {
    case Method.get:
      methodString = "GET";
      break;
    case Method.post:
      methodString = "POST";
      break;
    case Method.put:
      methodString = "PUT";
      break;
    case Method.delete:
      methodString = "DELETE";
      break;
    case Method.notif:
      methodString = "NOTIF";
      break;
  }

  data += "\x1B[31m[LOG-ERROR]\x1B[0m\n";
  data += "\x1B[31merror: $error\x1B[0m\n";
  data += "\x1B[31mmethod: $methodString\x1B[0m\n";
  data += "\x1B[31mend-point: $endpoint\x1B[0m\n";
  data += "\x1B[31mparams: $params\x1B[0m\n";
  data += "\x1B[31mdata: $data\x1B[0m\n";
  data += "\x1B[31mcode: ${responseData?.code}\x1B[0m\n";
  data += "\x1B[31mmessage: ${responseData?.message}\x1B[0m\n";
  data += "\x1B[31mdata: ${jsonEncode(responseData?.data)}\x1B[0m\n";
  log(data);
  if (error is DioException) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        showInSnackBar("Error Waktu Request Koneksi Berakhir");
        break;
      case DioExceptionType.sendTimeout:
        showInSnackBar("Error Waktu Request Pengiriman Berakhir");
        break;
      case DioExceptionType.receiveTimeout:
        showInSnackBar("Error Waktu Request Penerimaan Berakhir");
        break;
      case DioExceptionType.badCertificate:
        showInSnackBar("Error Sertifikat SSL Tidak Sah");
        break;
      case DioExceptionType.badResponse:
        if (error.response?.data != null) {
          if (error.response?.data['error']['name'] == "ValidationError") {
            showInSnackBar("Kombinasi email atau password salah !");
          } else {
            showInSnackBar("${error.response?.data['error']['message']}");
          }
        }
        break;
      case DioExceptionType.cancel:
        showInSnackBar("Error Batal Request");
        break;
      case DioExceptionType.connectionError:
        showInSnackBar("Error Waktu Koneksi Berakhir");
        break;
      case DioExceptionType.unknown:
        showInSnackBar("Error Request Tidak Diketahui");
        break;
    }
  }
  return Exception(error);
}
