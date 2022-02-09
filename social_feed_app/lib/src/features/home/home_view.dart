import 'package:flutter/material.dart';
import 'package:flutter_social_app/src/common/widgets/circular_user_avatar.dart';
import 'package:flutter_social_app/src/core/provider/base_view.dart';
import 'package:flutter_social_app/src/themes/app_colors.dart';
import 'package:flutter_social_app/src/themes/app_text_styles.dart';

import 'home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        vmBuilder: (context) => HomeViewModel(), builder: (context, vm, child) => _buildBody(context, vm));
  }

  Widget _buildBody(BuildContext context, HomeViewModel vm) {
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
                children: [
                  const Expanded(child: TextField()),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.camera))
                ],
              ),
            ),
            // SliverToBoxAdapter(
            //   child: SizedBox(
            //     height: 130,
            //     child: ListView.builder(
            //       itemBuilder: (_, index) {
            //         return Container(
            //           margin: EdgeInsets.fromLTRB(index == 0 ? 8 : 4, 8, 4, index == vm.categories.length - 1 ? 8 : 4),
            //           width: 80,
            //           child: CircularUserAvatar(
            //             imageUrl: 'https://randomuser.me/api/portraits/med/men/32.jpg',
            //             displayName: vm.categories[index].title,
            //             size: 50,
            //             hasBorder: true,
            //             outerBorderThickness: 2,
            //             innerBorderThickness: 4,
            //           ),
            //         );
            //       },
            //       itemCount: vm.categories.length,
            //       scrollDirection: Axis.horizontal,
            //     ),
            //   ),
            // ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Chủ đề',
                  style: TextStyles.heading1Bold,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  itemBuilder: (_, index) {
                    return Container(
                      margin:
                          EdgeInsets.fromLTRB(index == 0 ? 16 : 8, 8, index == vm.categories.length - 1 ? 16 : 8, 4),
                      padding: const EdgeInsets.all(16),
                      width: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), color: DarkTheme.darkGrey),
                      child: Text(
                        vm.categories[index].description,
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                  itemCount: vm.categories.length,
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
