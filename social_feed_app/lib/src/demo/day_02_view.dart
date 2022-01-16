import 'package:flutter/material.dart';
import 'package:flutter_social_app/src/common/widgets/active_status_indicator.dart';
import 'package:flutter_social_app/src/common/widgets/circular_user_avatar.dart';
import 'package:flutter_social_app/src/common/widgets/conversation_view.dart';
import 'package:flutter_social_app/src/themes/app_text_styles.dart';

class Day02View extends StatelessWidget {
  static const routeName = '/day02';
  const Day02View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: false,
            leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.arrow_back_rounded)),
            title: const Text(
              'Messages',
              style: TextStyles.heading1Bold,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 130,
              padding: const EdgeInsets.only(top: 14, bottom: 12),
              width: double.infinity,
              child: ListView.builder(
                itemBuilder: (_, index) {
                  return SizedBox(
                    width: 90,
                    child: CircularUserAvatar(
                      onPressed: () {},
                      imageUrl: 'https://source.unsplash.com/user/c_v_r/100x100',
                      size: 60,
                      bottomRightWidget: const ActiveStatusIndicator(
                        isActive: true,
                      ),
                      displayName: 'Khang',
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Divider(
              height: 1,
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
            return ConversationView(
              onPressed: () {},
              avatarWidget: const CircularUserAvatar(
                imageUrl: 'https://source.unsplash.com/user/c_v_r/100x100',
                size: 60,
              ),
              lastMessage: 'Nhậu khum?',
              title: 'Khang Nguyen',
              updatedTime: DateTime.now(),
            );
          }, childCount: 6))
        ],
      ),
    );
  }
}
