import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/app/app.dart';

import 'common/utils/app_assets.dart';
import 'common/utils/app_locales.dart';
import 'core/app_theme.dart';
import 'core/dependency_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupDependency();

  await startUpSetup();

  runApp(
    EasyLocalization(
      supportedLocales: AppLocales.locales,
      fallbackLocale: AppLocales.enIN,
      saveLocale: true,
      path: AppAssets.TRANSLATIONS,
      child: const App(),
    ),
  );
}

Future<void> startUpSetup() async {
  // Setting supported Orientations
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  // Setting status bar color
  SystemChrome.setSystemUIOverlayStyle(AppTheme.systemOverlayStyle);

  await Future.wait([
    EasyLocalization.ensureInitialized(),
    getIt.get<StoreManager>().initialize(),
  ]);


}
