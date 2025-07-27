import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/helpers/ui_helper.dart';
import 'package:weather_app/core/utils/asset_colors.dart';
import 'package:weather_app/core/utils/asset_paths.dart';
import 'package:weather_app/core/utils/asset_styles.dart';
import 'package:weather_app/core/utils/utils.dart';
import 'package:weather_app/data/weather/models/daily_weather.dart';
import 'package:weather_app/presentation/pages/home/custom_tab_weather.dart.dart';
import 'package:weather_app/presentation/pages/weather_daily/weather_daily_page.dart.dart';
import '../../../data/weather/provider/weather_provider.dart';
import 'widgets/card_weather_description.dart';
import 'widgets/number_celcius.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.only(right: 24, left: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero, // HILANGKAN padding bawaan
                    // constraints: BoxConstraints(),
                    onPressed: () {
                      nextScreen(WeatherDailyPage());
                    },
                    icon: SvgPicture.asset(AssetPaths.iconSearch),
                  ),
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
                "Stockholm, \nSweden",
                style: AssetStyles.heading.copyWith(height: 1.2),
              ),
              Text(
                "Tue, Jun 30",
                style: AssetStyles.description.copyWith(
                  color: AssetColors.textGreyColor,
                  fontWeight: FontWeight.w500,
                  // fontSize: 16,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AssetPaths.iconCloudy,
                    fit: BoxFit.cover,
                    width: screenHeightPercentage(context, percentage: 30),
                    height: screenHeightPercentage(context, percentage: 30),
                  ),
                  NumberCelcius(number: "19", weatherDescription: "Sunly"),
                ],
              ),
              // verticalSpace(16),
              CardWeatherDescription(
                icon: AssetPaths.iconUmbrella,
                title: "RainFalll",
                description: "3cm",
              ),
              verticalSpace(8),
              CardWeatherDescription(
                icon: AssetPaths.iconUmbrella,
                title: "RainFalll",
                description: "3cm",
              ),
              verticalSpace(8),
              CardWeatherDescription(
                icon: AssetPaths.iconUmbrella,
                title: "RainFalll",
                description: "3cm",
              ),
              verticalSpace(24),
              Expanded(child: CustomTabWeatherPage()),
            ],
          ),
        ),
      ),
    );
  }
}
