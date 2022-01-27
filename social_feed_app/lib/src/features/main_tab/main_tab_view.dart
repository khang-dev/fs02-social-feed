import 'package:flutter/material.dart';
import 'package:flutter_social_app/src/demo/day_03_view.dart';
import 'package:flutter_social_app/src/features/feed/feed_view.dart';
import 'package:flutter_social_app/src/features/messenges/messenges_view.dart';
import 'package:flutter_social_app/src/features/notifications/notifications_view.dart';
import 'package:flutter_social_app/src/features/profile/profile_view.dart';
import 'package:flutter_social_app/src/features/stream/stream_view.dart';
import 'package:flutter_social_app/src/themes/app_assets.dart';
import 'package:flutter_social_app/src/themes/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({Key? key}) : super(key: key);

  @override
  _MainTabViewState createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int _currentTabIndex = 0;
  static const List<Widget> _widgets = <Widget>[
    FeedView(),
    StreamView(),
    MessagesView(),
    NotificationsView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgets.elementAt(_currentTabIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            _buildNavBarItem('Home', svgIcon: AppAssets.tabFeedIcon),
            _buildNavBarItem('Streams', svgIcon: AppAssets.tabStreamIcon),
            _buildNavBarItem('Messages', svgIcon: AppAssets.tabMessagesIcon),
            _buildNavBarItem('Notifications', svgIcon: AppAssets.tabNotificationsIcon),
            _buildNavBarItem('Profiles', svgIcon: AppAssets.tabProfileIcon),
          ],
          currentIndex: _currentTabIndex,
          onTap: (index) {
            setState(() {
              _currentTabIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 11,
          unselectedFontSize: 11,
          backgroundColor: DarkTheme.darkerBackground,
          selectedItemColor: DarkTheme.red,
          unselectedItemColor: DarkTheme.darkGrey,
          iconSize: 24,
          elevation: 2.0),
    );
  }

  BottomNavigationBarItem _buildNavBarItem(String label, {required String svgIcon}) {
    return BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        svgIcon,
        color: DarkTheme.red,
      ),
      icon: SvgPicture.asset(
        svgIcon,
        color: DarkTheme.darkGrey,
      ),
      label: label,
    );
  }
}
