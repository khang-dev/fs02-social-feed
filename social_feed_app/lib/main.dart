import 'package:flutter/material.dart';
import 'package:social_feed_api/api/api_manager.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  ApiManager.instance.init('https://api.dofhunt.200lab.io/');
  runApp(MyApp(settingsController: settingsController));
}
