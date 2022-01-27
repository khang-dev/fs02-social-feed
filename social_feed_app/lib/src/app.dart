import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_social_app/src/demo/day_02_view.dart';
import 'package:flutter_social_app/src/demo/reusable_widgets_showcase_view.dart';
import 'package:flutter_social_app/src/features/main_tab/main_tab_view.dart';
import 'package:flutter_social_app/src/themes/app_colors.dart';
import 'demo/day_01_view.dart';
import 'demo/day_03_view.dart';
import 'demo/showcase_home_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          restorationScopeId: 'app',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],
          onGenerateTitle: (BuildContext context) => AppLocalizations.of(context)!.appTitle,
          theme: ThemeData(),
          darkTheme: DarkTheme.themeData,
          themeMode: settingsController.themeMode,
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case ShowcaseHomeView.routeName:
                    return const ShowcaseHomeView();
                  case ReusableWidgetsShowcaseView.routeName:
                    return const ReusableWidgetsShowcaseView();
                  case Day01View.routeName:
                    return const Day01View();
                  case Day02View.routeName:
                    return const Day02View();
                  case Day03View.routeName:
                    return const Day03View();
                  default:
                    return const MainTabView();
                }
              },
            );
          },
        );
      },
    );
  }
}
