import 'package:flutter/material.dart';
import 'package:flutter_social_app/src/common/widgets/circular_number_badge.dart';
import 'package:flutter_social_app/src/common/widgets/circular_user_avatar.dart';
import 'package:flutter_social_app/src/common/widgets/active_status_indicator.dart';
import 'package:flutter_social_app/src/common/widgets/conversation_view.dart';
import 'package:flutter_social_app/src/themes/app_colors.dart';
import 'package:flutter_social_app/src/themes/app_text_styles.dart';

class CommonWidgetsDemoView extends StatelessWidget {
  static const routeName = '/commonWidgetsDemo';
  const CommonWidgetsDemoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Common Widgets'),
      ),
      body: ListView(
        children: [
          const _WidgetNameLabel('Circular User Avatar'),
          _buildUserAvatarWidgets(),
          const _WidgetNameLabel('Status Indicators'),
          _buildStatusWidgetsRow(),
          const _WidgetNameLabel('Conversation View'),
          ConversationView(
            avatarWidget: const CircularUserAvatar(
                imageUrl:
                    'https://vtv1.mediacdn.vn/thumb_w/650/2021/11/18/tom-holland-in-spider-man-far-from-home-16372219999081867730777-crop-1637222004036539914417.jpg'),
            lastMessage: 'Hey! I need your help!!!',
            title: 'Petter Parker',
            updatedTime: DateTime.now(),
          )
        ],
      ),
    );
  }

  Row _buildUserAvatarWidgets() {
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: CircularUserAvatar(
            onPressed: () {},
            imageUrl: 'https://source.unsplash.com/user/c_v_r/100x100',
            size: 60,
            bottomRightWidget: const ActiveStatusIndicator(
              isActive: true,
            ),
            displayName: 'Khang',
          ),
        ),
        SizedBox(
          width: 80,
          child: CircularUserAvatar(
            onPressed: () {},
            imageUrl: 'https://source.unsplash.com/user/c_v_r/100x100',
            size: 60,
            bottomRightWidget: const CircularNumberBadge(10),
            displayName: 'Khang',
          ),
        ),
      ],
    );
  }

  Padding _buildStatusWidgetsRow() {
    const space = SizedBox(width: 24);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Row(
        children: const [
          ActiveStatusIndicator(
            isActive: false,
          ),
          space,
          ActiveStatusIndicator(
            isActive: true,
          ),
          space,
          CircularNumberBadge(1),
          space,
          CircularNumberBadge(999),
        ],
      ),
    );
  }
}

class _WidgetNameLabel extends StatelessWidget {
  final String name;
  const _WidgetNameLabel(
    this.name, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Text(
        name,
        style: TextStyles.body1.copyWith(color: DarkTheme.subTextColor),
      ),
    );
  }
}
