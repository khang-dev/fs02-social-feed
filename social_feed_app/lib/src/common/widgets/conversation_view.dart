import 'package:flutter/material.dart';
import 'package:flutter_social_app/src/themes/app_text_styles.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'circular_user_avatar.dart';

class ConversationView extends StatelessWidget {
  final double? height;
  final EdgeInsets? padding;
  final String title;
  final String lastMessage;
  final DateTime updatedTime;
  final bool isUnread;
  final String avatarUrl;
  final VoidCallback? onPressed;

  const ConversationView(
      {Key? key,
      this.height,
      this.padding,
      this.onPressed,
      this.isUnread = false,
      required this.avatarUrl,
      required this.title,
      required this.lastMessage,
      required this.updatedTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          width: double.infinity,
          height: height ?? 90,
          child: Padding(
            padding: padding ?? const EdgeInsets.only(left: 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularUserAvatar(
                  imageUrl: avatarUrl,
                  size: 60,
                ),
                const SizedBox(
                  width: 12,
                ),
                _buildConversationContent()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded _buildConversationContent() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTitleAndTime(),
          const SizedBox(
            height: 6,
          ),
          _buildLastMessage(),
          const Divider(
            height: 1,
            thickness: 1,
          ),
        ],
      ),
    );
  }

  Expanded _buildLastMessage() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(right: 6),
      child: Text(
        lastMessage,
        maxLines: 1,
        style: TextStyles.body1.copyWith(color: _textColor, fontWeight: isUnread ? FontWeight.w600 : FontWeight.w400),
        overflow: TextOverflow.ellipsis,
      ),
    ));
  }

  Color get _textColor {
    return isUnread ? Colors.white : Colors.white54;
  }

  Expanded _buildTitleAndTime() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: TextStyles.body1Bold.copyWith(
              color: _textColor,
            ),
          ),
          const Spacer(),
          Text(
            timeago.format(updatedTime),
            style: TextStyles.small1Light,
          ),
          const SizedBox(
            width: 14,
          )
        ],
      ),
    );
  }
}
