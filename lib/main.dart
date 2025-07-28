import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/presentation/pages/main_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await initializeDateFormatting('id_ID', null);
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) {
        return const MainApp();
      },
    ),
  );
}
