import 'package:flutter/material.dart';

import '../../../core/helpers/ui_helper.dart';
import '../../../core/utils/asset_styles.dart';

class ButtonGeneral extends StatelessWidget {
  const ButtonGeneral({super.key, required this.label, required this.onTap});
  final String label;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 44,
        width: screenWidth(context),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: AssetStyles.description.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
