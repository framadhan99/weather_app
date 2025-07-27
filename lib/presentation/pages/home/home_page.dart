import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/helpers/helpers.dart';
import 'package:weather_app/core/helpers/ui_helper.dart';
import 'package:weather_app/core/utils/utils.dart';
import 'package:weather_app/presentation/pages/weather_daily/weather_daily_page.dart.dart';
import '../../../data/weather/provider/weather/weather_provider.dart';
import 'widgets/card_weather_description.dart';
import 'widgets/custom_tab_weather.dart.dart';
import 'widgets/number_celcius.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final prov = context.watch<WeatherProvider>();
    final isLoading = prov.isLoading;
    final weather = prov.weather;
    return Scaffold(
      body: prov.isLoading
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Padding(
                padding: EdgeInsetsGeometry.only(right: 24, left: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // IconButton(
                        //   padding: EdgeInsets.zero, // HILANGKAN padding bawaan
                        //   // constraints: BoxConstraints(),
                        //   onPressed: () {
                        //     nextScreen(WeatherDailyPage());
                        //   },
                        //   icon: SvgPicture.asset(AssetPaths.iconSearch),
                        // ),
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
                    verticalSpace(24),
                    Text(
                      "${weather?.timezone ?? ""}",
                      style: AssetStyles.heading.copyWith(height: 1.2),
                    ),
                    Text(
                      "${weather?.current.dayName}",
                      style: AssetStyles.description.copyWith(
                        color: AssetColors.textGreyColor,
                        fontWeight: FontWeight.w500,
                        // fontSize: 16,
                      ),
                    ),
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
                                  verticalSpace(32),
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

                        NumberCelcius(
                          number:
                              "${weather?.current.temp.toString().split(".").first ?? ""}",
                          weatherDescription:
                              "${weather?.current.weather[0].main ?? ""}",
                        ),
                      ],
                    ),
                    verticalSpace(8),
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
                    // Today Tab
                    SizedBox(height: 150, child: CustomTabWeatherPage()),
                  ],
                ),
              ),
            ),
    );
  }
}
