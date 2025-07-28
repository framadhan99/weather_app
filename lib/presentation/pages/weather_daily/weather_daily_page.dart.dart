import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/helpers/helpers.dart';
import 'package:weather_app/core/utils/utils.dart';
import 'package:weather_app/presentation/pages/weather_daily/widgets/card_weather_daily.dart';

import '../../../data/weather/provider/weather/weather_provider.dart';

/// WeatherDailyPage displays the 7-day weather forecast to the user.
/// Weather data is obtained from `WeatherProvider` using the Provider state management.
/// This page shows a scrollable list of daily weather cards including icon, temperature, and day name.

class WeatherDailyPage extends StatelessWidget {
  const WeatherDailyPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Access WeatherProvider from the context
    final prov = context.watch<WeatherProvider>();
    final isLoading = prov.isLoading;
    final weather = prov.weather;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: Text(
          "Next 7 Days",
          style: AssetStyles.description.copyWith(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: isLoading
          // Show loading indicator while weather data is being fetched
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, top: 32),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: weather?.daily?.length ?? 1,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),

                          child: CardWeatherDaily(
                            icon: iconUrl(
                              // Load weather icon from API
                              "${weather?.daily?[index].weather[0].icon}",
                            ),
                            description:
                                // Display day temperature (without decimals)
                                "${weather?.daily?[index].temp.day.toString().split(".").first}°",
                            // Display day name (e.g., Monday, Tuesday)
                            title: "${weather?.daily?[index].dayName}",
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
