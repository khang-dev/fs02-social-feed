import 'package:flutter/material.dart';
import 'package:flutter_social_app/src/themes/app_colors.dart';
import 'package:flutter_social_app/src/themes/app_text_styles.dart';
import 'package:timeago/timeago.dart' as timeago;

class ConversationView extends StatelessWidget {
  final Widget avatarWidget;
  final double? height;
  final EdgeInsets? padding;
  final String title;
  final String lastMessage;
  final DateTime updatedTime;
  final bool isUnread;
  final VoidCallback? onPressed;

  const ConversationView(
      {Key? key,
      required this.avatarWidget,
      this.height,
      this.padding,
      this.onPressed,
      this.isUnread = false,
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
                avatarWidget,
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildTitleAndTime(),
                      const SizedBox(
                        height: 6,
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: Text(
                          lastMessage,
                          maxLines: 1,
                          style: TextStyles.body1.copyWith(color: _textColor),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )),
                      const Divider(
                        height: 1,
                        thickness: 1,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color get _timeTextColor {
    return isUnread ? Colors.white : DarkTheme.subTextColor;
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
            style: TextStyles.body1Bold.copyWith(color: _textColor),
          ),
          const Spacer(),
          Text(
            timeago.format(updatedTime),
            style: TextStyles.small1Light.copyWith(color: _timeTextColor),
          ),
          const SizedBox(
            width: 14,
          )
        ],
      ),
    );
  }
}
