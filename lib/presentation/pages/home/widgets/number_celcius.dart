import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/utils.dart';

class NumberCelcius extends StatelessWidget {
  const NumberCelcius({
    super.key,
    required this.number,
    required this.weatherDescription,
  });

  final String number;
  final String weatherDescription;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(number, style: AssetStyles.numberCelcius.copyWith(height: 1)),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: SvgPicture.asset(AssetPaths.iconDegree),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            weatherDescription,
            style: AssetStyles.description.copyWith(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
