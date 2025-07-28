import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/helpers/helpers.dart';
import 'package:weather_app/core/helpers/ui_helper.dart';
import 'package:weather_app/core/utils/utils.dart';
import 'package:weather_app/presentation/pages/login/login_page.dart';
import 'package:weather_app/presentation/pages/weather_daily/weather_daily_page.dart.dart';
import 'package:weather_app/presentation/widgets/button/button_general.dart';
import '../../../core/helpers/location_helper.dart';
import '../../../data/weather/provider/weather/weather_provider.dart';
import 'widgets/card_weather_description.dart';
import 'widgets/custom_tab_weather.dart.dart';
import 'widgets/number_celcius.dart';

/// HomePage displays the current weather information to the user.
/// Weather data is retrieved from the `WeatherProvider` using the Provider state management.
/// The screen includes navigation to the daily forecast page and a logout button.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the WeatherProvider to get weather data and loading state
    final prov = context.watch<WeatherProvider>();
    final isLoading = prov.isLoading;
    final weather = prov.weather;

    return Scaffold(
      body: isLoading
          // Show loading indicator while data is being fetched
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Padding(
                padding: EdgeInsetsGeometry.only(right: 24, left: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(
                      screenHeightPercentage(context, percentage: 1),
                    ),
                    // Top navigation row with icon buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 24),
                        SvgPicture.asset(AssetPaths.iconPoint),
                        IconButton(
                          onPressed: () {
                            nextScreen(WeatherDailyPage());
                          },
                          icon: SvgPicture.asset(AssetPaths.iconList),
                        ),
                      ],
                    ),
                    verticalSpace(
                      screenHeightPercentage(context, percentage: 2),
                    ),
                    // Welcome message and location info
                    Text(
                      "Welcome",
                      style: AssetStyles.description.copyWith(height: 1.2),
                    ),
                    Text(
                      "${prov.getCity}",
                      style: AssetStyles.heading.copyWith(height: 1.2),
                    ),
                    Text(
                      " ${weather?.current.dayName}",
                      style: AssetStyles.description.copyWith(
                        color: AssetColors.colorSecondary,
                        fontWeight: FontWeight.w500,
                        // fontSize: 16,
                      ),
                    ),
                    // Main weather content (icon + temperature + description)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        weather?.current.weather[0].icon != null
                            ? Column(
                                children: [
                                  Image.network(
                                    width: screenHeightPercentage(
                                      context,
                                      percentage: 30,
                                    ),
                                    height: screenHeightPercentage(
                                      context,
                                      percentage: 20,
                                    ),
                                    fit: BoxFit.cover,
                                    iconUrl(
                                      "${weather?.current.weather[0].icon}",
                                    ),
                                  ),
                                  verticalSpace(
                                    screenHeightPercentage(
                                      context,
                                      percentage: 3,
                                    ),
                                  ),
                                ],
                              )
                            : SvgPicture.asset(
                                AssetPaths.iconCloudy,
                                fit: BoxFit.cover,
                                width: screenHeightPercentage(
                                  context,
                                  percentage: 30,
                                ),
                                height: screenHeightPercentage(
                                  context,
                                  percentage: 30,
                                ),
                              ),
                        // Temperature and weather description widget
                        NumberCelcius(
                          number:
                              "${weather?.current.temp.toString().split(".").first}",
                          weatherDescription:
                              "${weather?.current.weather[0].main}",
                        ),
                      ],
                    ),
                    verticalSpace(8),
                    // Weather detail cards: wind speed & humidity
                    CardWeatherDescription(
                      icon: AssetPaths.iconWind,
                      title: "Wind",
                      description: "${weather?.current.windSpeed ?? ""}km/h",
                    ),
                    verticalSpace(8),
                    CardWeatherDescription(
                      icon: AssetPaths.iconHumidity,
                      title: "Humadity",
                      description: "${weather?.current.humidity ?? ""}%",
                    ),
                    verticalSpace(
                      screenHeightPercentage(context, percentage: 8),
                    ),
                    Spacer(),

                    // Horizontal scrollable weather tab section Today
                    SizedBox(
                      height: screenHeightPercentage(context, percentage: 18),
                      child: CustomTabWeatherPage(),
                    ),
                    Spacer(flex: 3),
                    // Logout Button
                    ButtonGeneral(
                      label: "Logout",
                      onTap: () => nextReplace(LoginPage()),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
