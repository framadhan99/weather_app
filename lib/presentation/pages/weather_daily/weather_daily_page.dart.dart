import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/helpers/helpers.dart';
import 'package:weather_app/core/helpers/ui_helper.dart';
import 'package:weather_app/core/utils/utils.dart';
import 'package:weather_app/presentation/pages/weather_daily/widgets/card_weather_daily.dart';

import '../../../data/weather/provider/weather/weather_provider.dart';

class WeatherDailyPage extends StatelessWidget {
  const WeatherDailyPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 32),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              height: screenHeightPercentage(context, percentage: 26),
              width: screenWidth(context),
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(110),
                border: Border.all(color: Colors.white, width: 0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Tomoro",
                          style: AssetStyles.description.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "19°",
                          style: AssetStyles.description.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SvgPicture.asset(AssetPaths.iconCloudy, width: 80),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Column(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              // fit: BoxFit.cover,
                              AssetPaths.iconUmbrella,
                              width: 30,
                            ),
                          ),
                          verticalSpace(8),
                          Text(
                            "1 cm",
                            style: AssetStyles.description.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      horizontalSpace(32),
                      Column(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              // fit: BoxFit.cover,
                              alignment: Alignment.bottomCenter,
                              AssetPaths.iconWind,
                              width: 42,
                            ),
                          ),
                          verticalSpace(8),
                          Text(
                            "15 km/h",
                            style: AssetStyles.description.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      horizontalSpace(32),
                      Column(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              fit: BoxFit.contain,
                              AssetPaths.iconHumidity,
                              width: 40,
                            ),
                          ),
                          verticalSpace(8),
                          Text(
                            "50%",
                            style: AssetStyles.description.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
            verticalSpace(32),
            Expanded(
              child: ListView.builder(
                itemCount: weather?.daily?.length ?? 1,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: CardWeatherDaily(
                      icon: iconUrl(
                        "${weather?.daily?[index].weather[0].icon}",
                      ),
                      description:
                          "${weather?.daily?[index].temp.day.toString().split(".").first}°",
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
