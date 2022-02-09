import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_social_app/src/common/widgets/circular_user_avatar.dart';
import 'package:flutter_social_app/src/themes/app_colors.dart';
import 'package:social_feed_api/api/api_manager.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<void> load() async {
    final response = await ApiManager.instance.loadCategories();
    log(response.toString());
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Material(
        color: DarkTheme.darkBackground,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Row(
                children: [Expanded(child: TextField()), IconButton(onPressed: () {}, icon: Icon(Icons.camera))],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 130,
                child: ListView.builder(
                  itemBuilder: (_, index) {
                    return Container(
                      margin: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                      child: const CircularUserAvatar(
                        imageUrl: 'https://randomuser.me/api/portraits/med/women/68.jpg',
                        displayName: 'Khang Nguyen',
                        size: 50,
                        hasBorder: true,
                        outerBorderThickness: 2,
                        innerBorderThickness: 4,
                      ),
                    );
                  },
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
