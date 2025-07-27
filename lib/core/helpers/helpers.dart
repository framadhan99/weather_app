import '../utils/strings.dart';

bool isEmpty(dynamic data) {
  String? dataString = '$data';
  return ['', 'null', '{}', '0', '[]'].contains(dataString);
}
