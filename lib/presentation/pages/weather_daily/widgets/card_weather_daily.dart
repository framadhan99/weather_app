import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/ui_helper.dart';
import '../../../../core/utils/utils.dart';

class CardWeatherDaily extends StatelessWidget {
  const CardWeatherDaily({
    super.key,
    required this.icon,
    required this.description,
    required this.title,
  });

  final String icon;
  final String description;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      height: 62,
      width: screenWidth(context),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(50),
        border: Border.all(color: Colors.white.withAlpha(80), width: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: AssetStyles.description.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(flex: 3),
          Text(
            description,
            style: AssetStyles.description.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          horizontalSpace(8),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Image.network(icon),
          ),
        ],
      ),
    );
  }
}
