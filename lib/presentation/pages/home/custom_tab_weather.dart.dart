import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/core/helpers/ui_helper.dart';
import 'package:weather_app/core/utils/utils.dart';
import 'package:weather_app/presentation/pages/home/home_page.dart';

class CustomTabWeatherPage extends StatefulWidget {
  const CustomTabWeatherPage({super.key});

  @override
  State<CustomTabWeatherPage> createState() => _CustomTabWeatherPageState();
}

class _CustomTabWeatherPageState extends State<CustomTabWeatherPage> {
  int selectedIndex = 0;
  final PageController _pageController = PageController();

  final List<String> tabs = ['Today', 'Tomorrow'];

  void _onTabSelected(int index) {
    setState(() => selectedIndex = index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void _onNext7DaysTapped() {
    nextScreen(HomePage());
  }

  @override
  Widget build(BuildContext context) {
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
                      onTap: _onNext7DaysTapped,
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
                                color: AssetColors.textColor.withAlpha(100),
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
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, indext) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            // vertical: 6,
                          ),
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
                                "Now",
                                style: AssetStyles.description.copyWith(
                                  fontSize: 10,
                                ),
                              ),

                              SvgPicture.asset(
                                // fit: BoxFit.cover,
                                AssetPaths.iconCloudy,
                                // width: 26,
                              ),
                              Text(
                                "19°",
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
                  Center(child: Text("Tomorrow's Forecast")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
