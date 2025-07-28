import 'package:flutter/widgets.dart';
import 'package:weather_app/core/utils/asset_colors.dart';

class AssetStyles {
  static const TextStyle numberCelcius = TextStyle(
    fontSize: 43,
    fontWeight: FontWeight.bold,
    color: AssetColors.colorPrimary,
  );
  static const TextStyle heading = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w500,
    color: AssetColors.colorPrimary,
  );

  static const TextStyle description = TextStyle(
    fontSize: 14,
    color: AssetColors.colorPrimary,
  );
}
