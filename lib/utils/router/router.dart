import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../pages/auth.dart';
import '../../pages/home.dart';
import '../../pages/ids/id_create.dart';
import '../../pages/ids/id_list.dart';
import '../../pages/info.dart';
import '../../pages/storage.dart';
import '../../pages/user/user_create.dart';
import '../../pages/user/user_details.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
// final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter pageRouter = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/auth',
    routes: [
      GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/id-list',
        builder: (context, state) => const IdList(),
      ),
      GoRoute(
        path: '/id-create',
        builder: (context, state) => const IdCreate(),
      ),
      GoRoute(
        path: '/id-list',
        builder: (context, state) => const IdList(),
      ),
      GoRoute(
        path: '/user-details',
        builder: (context, state) => const UserPage(),
      ),
      GoRoute(
        path: '/user-create',
        builder: (context, state) => const UserCreatePage(),
      ),
      GoRoute(
        path: '/info',
        name: 'Info',
        builder: (context, state) => const AppInfoPage(),
      ),
      GoRoute(
        path: '/storage',
        builder: (context, state) => const StorageSettingPage(),
      ),
    ]);


/* 
class PageRouter {
  void navigateToPage(Widget widgetName, BuildContext widgetContext) {
    Navigator.of(widgetContext)
        .push(MaterialPageRoute(builder: (context) => widgetName));
  }
} 
*/