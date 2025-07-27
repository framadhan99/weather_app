import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/ui_helper.dart';
import '../../../../core/utils/utils.dart';

class CardWeatherDescription extends StatelessWidget {
  const CardWeatherDescription({
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
      padding: EdgeInsets.only(left: 10, top: 8, bottom: 8),
      height: 42,
      width: screenWidth(context),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(75),
        border: Border.all(color: Colors.white.withAlpha(80), width: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              // fit: BoxFit.cover,
              icon,
              width: 26,
            ),
          ),
          horizontalSpace(8),
          Text(title, style: AssetStyles.description.copyWith(fontSize: 12)),
          Spacer(flex: 3),
          Text(
            description,
            style: AssetStyles.description.copyWith(fontSize: 12),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
