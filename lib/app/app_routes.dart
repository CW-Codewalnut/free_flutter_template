export 'package:go_router/go_router.dart';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../common/utils/global_keys.dart';
import '../features/home/home_screen.dart';
import '../features/webview/webview_screen.dart';

BuildContext get navigator => navigationKey.currentContext!;

class  AppRoutes {

  AppRoutes();

  static const base = '/';
  static const home = '/home';
  static const webViewName = 'webView';
  static const webView = '/$webViewName';

  // GoRouter configuration
  static final appRouters = GoRouter(
    initialLocation: AppRoutes.base,
    navigatorKey: navigationKey,
    routes: [

      GoRoute(
        path: AppRoutes.base,
        redirect: (_, __)  => AppRoutes.home,
      ),

      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomeScreen(),
      ),

      GoRoute(
        name: AppRoutes.webViewName,
        path: AppRoutes.webView,
        builder: (context, state) {
          final queryParameters = state.uri.queryParameters;
          return WebViewScreen(url: queryParameters["url"] ?? "", title: queryParameters["title"]);
        },
      ),
    ],
  );

}

