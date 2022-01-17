import 'package:flutter/material.dart';
import 'package:flutter_social_app/src/common/widgets/circular_number_badge.dart';
import 'package:flutter_social_app/src/common/widgets/circular_user_avatar.dart';
import 'package:flutter_social_app/src/common/widgets/active_status_indicator.dart';
import 'package:flutter_social_app/src/common/widgets/conversation_view.dart';
import 'package:flutter_social_app/src/themes/app_colors.dart';
import 'package:flutter_social_app/src/themes/app_text_styles.dart';

class ReusableWidgetsShowcaseView extends StatelessWidget {
  static const routeName = '/reusableWidgetsShowcase';
  const ReusableWidgetsShowcaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reusable Widgets'),
      ),
      body: ListView(
        children: [
          const _WidgetNameLabel('Circular User Avatar'),
          _buildUserAvatarWidgets(),
          const _WidgetNameLabel('Status Indicators'),
          _buildStatusWidgetsRow(),
          const _WidgetNameLabel('Conversation View'),
          ConversationView(
            avatarUrl: 'https://i.ibb.co/mhXrrTm/avt-6.png',
            lastMessage: 'Where are you now',
            title: 'Petter Parker',
            updatedTime: DateTime.now(),
            isUnread: true,
          ),
          ConversationView(
            avatarUrl: 'https://i.ibb.co/cydcfMj/avt-5.png',
            lastMessage: 'Talk to you later',
            title: 'Tim Cook',
            updatedTime: DateTime.now().add(const Duration(hours: -5)),
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
            imageUrl: 'https://i.ibb.co/chHwp47/avt-8.png',
            size: 60,
            bottomRightWidget: const ActiveStatusIndicator(
              isActive: true,
            ),
            displayName: 'Tiểu My',
          ),
        ),
        SizedBox(
          width: 80,
          child: CircularUserAvatar(
            onPressed: () {},
            imageUrl: 'https://i.ibb.co/chHwp47/avt-8.png',
            size: 60,
            displayName: 'Tiểu My',
            hasBorder: true,
          ),
        ),
        SizedBox(
          width: 80,
          child: CircularUserAvatar(
            onPressed: () {},
            imageUrl: 'https://i.ibb.co/chHwp47/avt-8.png',
            size: 60,
            bottomRightWidget: const CircularNumberBadge(10),
            displayName: 'Tiểu My',
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
