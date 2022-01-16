import 'package:flutter/material.dart';

class CommonWidgetsDemoView extends StatelessWidget {
  static const routeName = '/commonWidgetsDemo';
  const CommonWidgetsDemoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Common Widgets'),
      ),
    );
  }
}
