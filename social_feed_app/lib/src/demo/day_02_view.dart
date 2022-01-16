import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_social_app/src/common/widgets/active_status_indicator.dart';
import 'package:flutter_social_app/src/common/widgets/circular_user_avatar.dart';
import 'package:flutter_social_app/src/common/widgets/conversation_view.dart';
import 'package:flutter_social_app/src/models/conversation.dart';
import 'package:flutter_social_app/src/models/user.dart';
import 'package:flutter_social_app/src/themes/app_text_styles.dart';

class Day02View extends StatefulWidget {
  static const routeName = '/day02';
  const Day02View({Key? key}) : super(key: key);

  @override
  State<Day02View> createState() => _Day02ViewState();
}

class _Day02ViewState extends State<Day02View> {
  List<User> users = [];
  List<Conversation> conversations = [];
  @override
  void initState() {
    super.initState();
    log(DateTime.now().toString());
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
            leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.arrow_back_rounded)),
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
                      imageUrl: model.avatarUrl,
                      bottomRightWidget: ActiveStatusIndicator(
                        isActive: model.isActive,
                      ),
                      displayName: model.displayName,
                      hasBorder: model.hasStory,
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
              avatarWidget: CircularUserAvatar(
                imageUrl: model.avatarUrl,
                size: 60,
              ),
              lastMessage: model.lastMessage,
              title: model.title,
              updatedTime: model.lastUpdatedTime,
              isUnread: model.isUnread,
            );
          }, childCount: conversations.length))
        ],
      ),
    );
  }
}
