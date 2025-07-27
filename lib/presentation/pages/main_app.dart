import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/navigation_services.dart';
import 'package:weather_app/presentation/pages/app_theme.dart';
import 'package:weather_app/presentation/pages/home/custom_tab_weather.dart.dart';

import 'home/home_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      navigatorKey: navigatorKey,
      home: const HomePage(),
      builder: (context, child) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xffFAE2C7), Color(0xFFFFBE85)],
              begin: Alignment(-1, 0),
              end: Alignment(-0, 1),
            ),
          ),
          child: child,
        );
      },
    );
  }
}
