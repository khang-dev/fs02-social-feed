import 'package:flutter/material.dart';
import 'package:flutter_social_app/src/themes/app_colors.dart';

class ActiveStatusIndicator extends StatelessWidget {
  final bool isActive;
  const ActiveStatusIndicator({Key? key, this.isActive = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? AppColors.green : DarkTheme.darkerBackground,
          border: const Border.fromBorderSide(BorderSide(color: Colors.white, width: 2))),
      width: 14,
      height: 14,
    );
  }
}
