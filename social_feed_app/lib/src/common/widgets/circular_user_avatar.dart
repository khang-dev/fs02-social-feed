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
  final Widget? bottomRightWidget;
  final bool hasBorder;
  const CircularUserAvatar(
      {Key? key,
      required this.imageUrl,
      this.onPressed,
      this.size,
      this.bottomRightWidget,
      this.displayName,
      this.hasBorder = false})
      : super(key: key);

  static const double _defaultSize = 60;

  @override
  Widget build(BuildContext context) {
    final image = Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: hasBorder
              ? const LinearGradient(colors: [
                  GradientPalette.pink,
                  GradientPalette.orange,
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)
              : null),
      child: ClipOval(
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
      ),
    );

    final avatarWidget = bottomRightWidget == null
        ? image
        : Stack(
            children: [image, Positioned(bottom: 0, right: 4, child: bottomRightWidget!)],
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
