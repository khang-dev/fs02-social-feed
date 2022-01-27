import 'package:flutter/material.dart';
import 'package:flutter_social_app/src/themes/app_colors.dart';
import 'package:flutter_social_app/src/themes/app_text_styles.dart';

class CircularNumberBadge extends StatelessWidget {
  final int number;
  const CircularNumberBadge(
    this.number, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.5),
      decoration: BoxDecoration(
          color: DarkTheme.red,
          border: const Border.fromBorderSide(BorderSide(width: .5, color: Colors.white)),
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(colors: [
            GradientPalette.orange,
            GradientPalette.pink,
          ])),
      constraints: const BoxConstraints(
        minWidth: 20,
        minHeight: 20,
      ),
      alignment: Alignment.center,
      child: Text(
        '$number',
        style: TextStyles.small1Light.copyWith(height: 1.2, color: Colors.white, fontSize: 12),
        textAlign: TextAlign.center,
      ),
    );
  }
}
