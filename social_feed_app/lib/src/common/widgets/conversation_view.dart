import 'package:flutter/material.dart';
import 'package:flutter_social_app/src/themes/app_text_styles.dart';

class ConversationView extends StatelessWidget {
  final Widget avatarWidget;
  final double? height;
  final EdgeInsets? padding;
  final String title;
  final String lastMessage;
  final DateTime updatedTime;
  final VoidCallback? onPressed;

  const ConversationView(
      {Key? key,
      required this.avatarWidget,
      this.height,
      this.padding,
      this.onPressed,
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
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: padding ?? const EdgeInsets.symmetric(horizontal: 14),
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
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    title,
                                    style: TextStyles.body1Bold,
                                  ),
                                  const Spacer(),
                                  Text(
                                    '${updatedTime.hour}:${updatedTime.minute}',
                                    style: TextStyles.small1Light,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Expanded(
                                child: Text(
                              lastMessage,
                              maxLines: 1,
                              style: TextStyles.body1,
                              overflow: TextOverflow.ellipsis,
                            ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Divider(
                indent: 100,
                endIndent: 0,
                height: 2,
                thickness: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
