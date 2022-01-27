import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_social_app/src/common/widgets/active_status_indicator.dart';
import 'package:flutter_social_app/src/common/widgets/circular_user_avatar.dart';
import 'package:flutter_social_app/src/common/widgets/conversation_view.dart';
import 'package:social_feed_api/models/conversation.dart';
import 'package:social_feed_api/models/user.dart';
import 'package:flutter_social_app/src/themes/app_text_styles.dart';

class Day03View extends StatefulWidget {
  static const routeName = '/day03';
  const Day03View({Key? key}) : super(key: key);

  @override
  State<Day03View> createState() => _Day03ViewState();
}

class _Day03ViewState extends State<Day03View> {
  List<User> users = [];
  List<Conversation> conversations = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _loadUsersJsonData();
      _loadConversationJsonData();
    });
  }

  Future<void> _loadUsersJsonData() async {
    try {
      String usersDataStr = await rootBundle.loadString('assets/json/users_test_data.json');
      List<dynamic> usersList = json.decode(usersDataStr);

      setState(() {
        users = usersList.map((e) => User.fromJson(e)).toList();
        users.sort((a, b) {
          final aValue = a.status == 'online' ? 1 : 0;
          final bValue = b.status == 'online' ? 1 : 0;
          return bValue.compareTo(aValue);
        });
      });
    } catch (ex) {
      log(ex.toString());
    }
  }

  Future<void> _loadConversationJsonData() async {
    try {
      String conversationsDataStr = await rootBundle.loadString('assets/json/conversation_test_data.json');
      List<dynamic> conversationsList = json.decode(conversationsDataStr);

      setState(() {
        conversations = conversationsList.map((e) => Conversation.fromJson(e)).toList();
      });
    } catch (ex) {
      log(ex.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: false,
            leading:
                IconButton(onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.arrow_back_rounded)),
            title: const Text(
              'Messages',
              style: TextStyles.heading1Bold,
            ),
            actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 130,
              padding: const EdgeInsets.only(top: 14, bottom: 12),
              width: double.infinity,
              child: ListView.builder(
                itemBuilder: (_, index) {
                  final model = users[index];
                  return Container(
                    width: 80,
                    margin: EdgeInsets.only(left: index == 0 ? 8 : 0, right: index == (users.length - 1) ? 8 : 0),
                    child: CircularUserAvatar(
                      onPressed: () {},
                      imageUrl: model.picture.medium,
                      bottomRightWidget: ActiveStatusIndicator(
                        isActive: model.status == 'online',
                      ),
                      displayName: model.name,
                      hasBorder: false,
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: users.length,
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
            final model = conversations[index];
            return ConversationView(
              onPressed: () {},
              avatarUrl: model.user.picture.medium,
              lastMessage: model.text,
              title: model.user.name,
              updatedTime: model.createdAt,
              isUnread: model.unreadCount > 0,
              unreadCount: model.unreadCount,
            );
          }, childCount: conversations.length))
        ],
      ),
    );
  }
}
