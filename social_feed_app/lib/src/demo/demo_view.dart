import 'package:flutter/material.dart';

import 'common_widgets_demo_view.dart';

class DemoView extends StatelessWidget {
  static const routeName = '/demo';

  const DemoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Screens'),
      ),
      body: ListView(
        children: [
          _NavigationListTile(
            title: 'Common Widgets',
            navigationRoute: CommonWidgetsDemoView.routeName,
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
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.of(context).pushNamed(navigationRoute);
        },
        title: Text(title),
      ),
    );
  }
}

class NavigationListTile {}
