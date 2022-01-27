import 'package:flutter/material.dart';
import 'package:flutter_social_app/src/themes/app_colors.dart';
import 'package:flutter_social_app/src/themes/app_text_styles.dart';

import 'day_03_view.dart';
import 'reusable_widgets_showcase_view.dart';
import 'day_01_view.dart';
import 'day_02_view.dart';

class ShowcaseHomeView extends StatelessWidget {
  static const routeName = '/showcaseHome';

  const ShowcaseHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Showcase'),
      ),
      body: ListView(
        children: const [
          _NavigationListTile(
            title: 'Reusable Widgets',
            navigationRoute: ReusableWidgetsShowcaseView.routeName,
          ),
          _NavigationListTile(
            title: 'Day 01 - UI Challenge',
            navigationRoute: Day01View.routeName,
          ),
          _NavigationListTile(
            title: 'Day 02 - UI Challenge',
            navigationRoute: Day02View.routeName,
          ),
          _NavigationListTile(
            title: 'Day 03 - Data Model',
            navigationRoute: Day03View.routeName,
          ),
        ],
      ),
    );
  }
}

class _NavigationListTile extends StatelessWidget {
  final String title;
  final String navigationRoute;
  const _NavigationListTile({
    Key? key,
    required this.title,
    required this.navigationRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      child: Material(
        color: DarkTheme.darkerBackground,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.of(context).pushNamed(navigationRoute);
          },
          child: ListTile(
            contentPadding: const EdgeInsets.only(left: 24, right: 12),
            title: Text(
              title,
              style: TextStyles.body1,
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
          ),
        ),
      ),
    );
  }
}

class NavigationListTile {}
