import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_app/src/themes/app_colors.dart';
import 'package:flutter_social_app/src/themes/app_text_styles.dart';

class CircularUserAvatar extends StatelessWidget {
  final String imageUrl;
  final VoidCallback? onPressed;
  final String? displayName;
  final double? size;
  final double outerBorderThickness;
  final double innerBorderThickness;
  final Widget? bottomRightWidget;
  final bool hasBorder;
  const CircularUserAvatar(
      {Key? key,
      required this.imageUrl,
      this.onPressed,
      this.size,
      this.bottomRightWidget,
      this.displayName,
      this.outerBorderThickness = 2,
      this.innerBorderThickness = 6,
      this.hasBorder = false})
      : super(key: key);

  static const double _defaultSize = 60;

  @override
  Widget build(BuildContext context) {
    final image = ClipOval(
      child: InkWell(
        borderRadius: BorderRadius.circular(size ?? _defaultSize),
        onTap: onPressed,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          width: size ?? _defaultSize,
          height: size ?? _defaultSize,
          errorWidget: (context, url, error) {
            log(error.toString());
            return const _ErrorImageContent();
          },
          placeholder: (context, _) => const _ErrorImageContent(),
        ),
      ),
    );

    final avatarImage = hasBorder
        ? _BorderedWidget(
            child: image,
            innerBorderThickness: innerBorderThickness,
            outerBorderThickness: outerBorderThickness,
          )
        : image;

    final avatarWidget = bottomRightWidget == null
        ? avatarImage
        : Stack(
            children: [avatarImage, Positioned(bottom: 0, right: 4, child: bottomRightWidget!)],
          );

    if (displayName == null) {
      return avatarWidget;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        avatarWidget,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            displayName!,
            style: TextStyles.small1Bold.copyWith(fontSize: 11),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}

class _BorderedWidget extends StatelessWidget {
  final double outerBorderThickness;
  final double innerBorderThickness;
  final Widget child;
  const _BorderedWidget({
    Key? key,
    required this.child,
    this.outerBorderThickness = 2,
    this.innerBorderThickness = 6,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(outerBorderThickness),
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(colors: [
            GradientPalette.orange,
            GradientPalette.red,
          ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
      child: Container(
          padding: EdgeInsets.all(innerBorderThickness),
          decoration: const BoxDecoration(shape: BoxShape.circle, color: DarkTheme.darkBackground),
          child: child),
    );
  }
}

class _ErrorImageContent extends StatelessWidget {
  const _ErrorImageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DarkTheme.darkGrey,
    );
  }
}
