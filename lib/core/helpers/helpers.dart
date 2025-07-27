import '../utils/strings.dart';

bool isEmpty(dynamic data) {
  String? dataString = '$data';
  return ['', 'null', '{}', '0', '[]'].contains(dataString);
}

String iconUrl(String iconCode) {
  return 'https://openweathermap.org/img/wn/$iconCode@4x.png';
}
