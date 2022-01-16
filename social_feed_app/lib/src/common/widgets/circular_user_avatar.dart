import 'package:flutter/material.dart';
import 'package:flutter_social_app/src/themes/app_text_styles.dart';

class CircularUserAvatar extends StatelessWidget {
  final String imageUrl;
  final VoidCallback? onPressed;
  final String? displayName;
  final double? size;
  final Widget? bottomRightWidget;
  const CircularUserAvatar(
      {Key? key, required this.imageUrl, this.onPressed, this.size, this.bottomRightWidget, this.displayName})
      : super(key: key);

  static const double _defaultSize = 60;

  @override
  Widget build(BuildContext context) {
    final image = Padding(
      padding: const EdgeInsets.all(2),
      child: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: Ink.image(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
            width: size ?? _defaultSize,
            height: size ?? _defaultSize,
            child: InkWell(onTap: onPressed),
          ),
        ),
      ),
    );

    if (bottomRightWidget == null) {
      return image;
    }

    final avatarWithBottomRightWidget = Stack(
      children: [image, Positioned(bottom: 0, right: 4, child: bottomRightWidget!)],
    );

    if (displayName == null) {
      return avatarWithBottomRightWidget;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        avatarWithBottomRightWidget,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            displayName!,
            style: TextStyles.small1Bold,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
