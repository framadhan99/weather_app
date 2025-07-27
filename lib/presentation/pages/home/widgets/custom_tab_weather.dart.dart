import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/helpers/helpers.dart';
import 'package:weather_app/core/helpers/ui_helper.dart';
import 'package:weather_app/core/utils/utils.dart';
import 'package:weather_app/data/weather/provider/weather/weather_provider.dart';
import 'package:weather_app/presentation/pages/weather_daily/weather_daily_page.dart.dart';

class CustomTabWeatherPage extends StatefulWidget {
  const CustomTabWeatherPage({super.key});

  @override
  State<CustomTabWeatherPage> createState() => _CustomTabWeatherPageState();
}

class _CustomTabWeatherPageState extends State<CustomTabWeatherPage> {
  int selectedIndex = 0;
  final PageController _pageController = PageController();

  final List<String> tabs = ['Today'];

  void _onTabSelected(int index) {
    setState(() => selectedIndex = index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    final prov = context.watch<WeatherProvider>();
    final isLoading = prov.isLoading;
    final weatherHourly = prov.weather?.hourly;
    final weatherTomorrow = prov.weather?.daily?[1];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Custom Tab Row
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 1),
                  height: 1,
                  color: AssetColors.textColor.withAlpha(40),
                ),
                Row(
                  children: [
                    ...List.generate(tabs.length, (index) {
                      final isSelected = selectedIndex == index;
                      return Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: GestureDetector(
                          onTap: () => _onTabSelected(index),
                          child: Column(
                            children: [
                              Text(
                                tabs[index],
                                style: AssetStyles.description.copyWith(
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.w500,
                                  fontSize: 12,
                                  color: isSelected
                                      ? AssetColors.textColor
                                      : AssetColors.textColor.withAlpha(100),
                                ),
                              ),
                              verticalSpace(10),
                              if (isSelected)
                                Container(
                                  // margin: const EdgeInsets.only(top: 4),
                                  width: 14,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AssetColors.textColor,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    }),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => nextScreen(WeatherDailyPage()),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Next 7 Days",
                              style: AssetStyles.description.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: AssetColors.textColor,
                              ),
                            ),
                            horizontalSpace(8),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 10,
                              color: AssetColors.textColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            verticalSpace(12),

            // Page Content
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  // Tab Today
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: weatherHourly?.length ?? 1,
                    itemBuilder: (context, indext) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            // vertical: 6,
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(75),
                            border: Border.all(
                              color: Colors.white.withAlpha(80),
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${weatherHourly?[indext].minute}",
                                style: AssetStyles.description.copyWith(
                                  fontSize: 10,
                                ),
                              ),
                              weatherHourly?[indext].weather[0].icon != null
                                  ? Image.network(
                                      iconUrl(
                                        "${weatherHourly?[indext].weather[0].icon}",
                                      ),
                                      fit: BoxFit.contain,
                                      width: 32,
                                      height: 32,
                                    )
                                  : SvgPicture.asset(
                                      // fit: BoxFit.cover,
                                      AssetPaths.iconCloudy,
                                      // width: 26,
                                    ),
                              Text(
                                "${weatherHourly?[indext].temp.toString().split(".").first}°",
                                style: AssetStyles.description.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  // Tab Tomorrow
                  // ListView.builder(
                  //   scrollDirection: Axis.horizontal,
                  //   itemCount: weatherTomorrow?.weather.length ?? 1,
                  //   itemBuilder: (context, indext) {
                  //     return Padding(
                  //       padding: const EdgeInsets.only(right: 16),
                  //       child: Container(
                  //         padding: EdgeInsets.symmetric(
                  //           horizontal: 8,
                  //           // vertical: 6,
                  //         ),
                  //         height: 50,
                  //         decoration: BoxDecoration(
                  //           color: Colors.white.withAlpha(75),
                  //           border: Border.all(
                  //             color: Colors.white.withAlpha(80),
                  //             width: 0.5,
                  //           ),
                  //           borderRadius: BorderRadius.circular(20),
                  //         ),
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             Text(
                  //               "${weatherTomorrow?.hourly[indext].dt}",
                  //               style: AssetStyles.description.copyWith(
                  //                 fontSize: 10,
                  //               ),
                  //             ),
                  //             weatherHourly?[indext].weather[0].icon != null
                  //                 ? Image.network(
                  //                     iconUrl(
                  //                       "${weatherHourly?[indext].weather[0].icon}",
                  //                     ),
                  //                     fit: BoxFit.contain,
                  //                     width: 32,
                  //                     height: 32,
                  //                   )
                  //                 : SvgPicture.asset(
                  //                     // fit: BoxFit.cover,
                  //                     AssetPaths.iconCloudy,
                  //                     // width: 26,
                  //                   ),
                  //             Text(
                  //               "${weatherHourly?[indext].temp}°",
                  //               style: AssetStyles.description.copyWith(
                  //                 fontSize: 12,
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
