import 'package:flutter/material.dart';

import '../../../login/views/login_screen_view.dart';
class LogoutNavigator extends StatefulWidget {
  const LogoutNavigator({Key? key}) : super(key: key);

  @override
  State<LogoutNavigator> createState() => _LogoutNavigatorState();
}

class _LogoutNavigatorState extends State<LogoutNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: NavigatorKeys.logoutNavigatorKey, // Use the defined key
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) {
            return const LoginScreenView(); // Your login screen widget
          },
        );
      },
    );
  }
}

class NavigatorKeys {
  static final GlobalKey<NavigatorState> logoutNavigatorKey =
      GlobalKey<NavigatorState>();
}