import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/utils/navigation_services.dart';
import 'package:weather_app/data/weather/provider/app/app_start_provider.dart';
import 'package:weather_app/data/weather/provider/weather/weather_provider.dart';
import 'package:weather_app/presentation/pages/app_theme.dart';
import 'package:weather_app/presentation/pages/home/widgets/custom_tab_weather.dart.dart';
import 'package:weather_app/presentation/pages/login/login_page.dart';
import 'package:weather_app/presentation/pages/splash/splash_page.dart';
import 'package:weather_app/presentation/pages/weather_daily/weather_daily_page.dart.dart';

import 'home/home_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WeatherProvider()),
        ChangeNotifierProvider(create: (_) => AppStartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        navigatorKey: navigatorKey,
        home: const SplashPage(),
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
      ),
    );
  }
}
