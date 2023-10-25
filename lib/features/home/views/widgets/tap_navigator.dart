import 'package:flutter/material.dart';
import 'package:job_app/features/home/views/widgets/saved_jobs_screen.dart';
import '../../../applied job/views/applied_job_view.dart';
import '../../../messages/views/messages_view.dart';
import '../../../profile/views/profile_view.dart';
import '../home_view.dart';

//  used to manage navigation for each tab.
// to create individual navigation stacks for each tab.
class TabNavigator extends StatelessWidget {
  const TabNavigator(
      {super.key, required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      //The onGenerateRoute function returns a MaterialPageRoute based on the selected tab. It navigates to the appropriate screen when the tab is selected.
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) {
            switch (tabItem) {
              case "Page1":
                return const HomeView();
              case "Page2":
                return const MessagesView();
              case "Page3":
                return const AppliedJobView();
              case "Page4":
                return const SavedJobsScreen();
              case "Page5":
                return const ProfileView();
              default:
                return const HomeView();
            }
          },
        );
      },
    );
  }
}
