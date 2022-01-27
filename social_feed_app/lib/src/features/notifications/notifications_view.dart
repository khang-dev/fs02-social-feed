import 'package:flutter/material.dart';
import 'package:flutter_social_app/src/themes/app_colors.dart';
import 'package:flutter_social_app/src/themes/app_text_styles.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  _NotificationsViewState createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyles.heading1Bold,
        ),
        centerTitle: false,
      ),
      body: ListView.builder(
        itemBuilder: (_, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: DarkTheme.darkGrey,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Notification ${index}'),
                SizedBox(
                  height: 12,
                ),
                Text(
                  '10 hrs ago',
                  style: TextStyles.small1Light,
                ),
                SizedBox(
                  height: 12,
                ),
                Divider(
                  height: 1,
                )
              ],
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
