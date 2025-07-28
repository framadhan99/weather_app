import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/core/utils/asset_paths.dart';
import 'package:weather_app/core/utils/asset_styles.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(60),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withAlpha(150), width: 0.5),
          ),
          child: SvgPicture.asset(
            AssetPaths.iconCloudy,
            width: 150,
            height: 200,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Text(
            "Weather App",
            style: AssetStyles.heading.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
