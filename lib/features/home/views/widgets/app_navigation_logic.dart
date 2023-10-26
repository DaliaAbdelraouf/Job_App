import 'package:flutter/material.dart';
import 'package:job_app/features/home/views/widgets/tap_navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppNavigationLogic extends StatefulWidget {
  const AppNavigationLogic({Key? key}) : super(key: key);

  @override
  State<AppNavigationLogic> createState() => _AppNavigationLogicState();
}

class _AppNavigationLogicState extends State<AppNavigationLogic> {
  bool isLoggedIn = false; // Initialize to false if not logged in

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final status = prefs.getBool('isLoggedIn') ?? false;
    setState(() {
      isLoggedIn = status;
    });
  }
  int _selectedTab = 0;
  String _currentPage = "Page1"; //string represents current page name
  List<String> pageKeys = ["Page1", "Page2", "Page3", "Page4", "Page5"];

  //map associates each page name with a GlobalKey<NavigatorState>, used to control the navigation stack of each page independently. (separate navigation stacks for each tab)
  final Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "Page1": GlobalKey<NavigatorState>(),
    "Page2": GlobalKey<NavigatorState>(),
    "Page3": GlobalKey<NavigatorState>(),
    "Page4": GlobalKey<NavigatorState>(),
    "Page5": GlobalKey<NavigatorState>(),
  };

//checks if the selected tab is the current page, and if so, it pops all routes until reaching the first route
  void _selectTab(String tabItem, int index) {
    if (tabItem == _currentPage) {
      // Pop to the first route if the tab is already selected.
      _navigatorKeys[tabItem]?.currentState?.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = pageKeys[index];
        _selectedTab = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // WillPopScope widget handles the back button behavior and allows navigating between different tabs
    return WillPopScope(
      onWillPop: () async {
        final navigatorState = _navigatorKeys[_currentPage]?.currentState;

        final isFirstRouteInCurrentTab =
            navigatorState != null && !await navigatorState.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentPage != "Page1") {
            _selectTab("Page1", 1);

            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator("Page1"),
          _buildOffstageNavigator("Page2"),
          _buildOffstageNavigator("Page3"),
          _buildOffstageNavigator("Page4"),
          _buildOffstageNavigator("Page5"),
        ]),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            textTheme: Theme.of(context).textTheme.copyWith(
                  bodyLarge: const TextStyle(
                    color: Colors.blue,
                  ),
                ),
          ),
          child: BottomNavigationBar(
            onTap: (int index) {
              _selectTab(pageKeys[index], index);
            },
            currentIndex: _selectedTab,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: _selectedTab == 0
                    ? Image.asset('assets/images/home_filled.png')
                    : Image.asset('assets/images/home.png'),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: _selectedTab == 1
                    ? Image.asset('assets/images/message_filled.png')
                    : Image.asset('assets/images/message.png'),
                label: 'Messages',
              ),
              BottomNavigationBarItem(
                icon: _selectedTab == 2
                    ? Image.asset('assets/images/briefcase_filled.png')
                    : Image.asset('assets/images/briefcase.png'),
                label: 'Applied',
              ),
              BottomNavigationBarItem(
                icon: _selectedTab == 3
                    ? Image.asset('assets/images/archive-minus_filled.png')
                    : Image.asset('assets/images/archive-minus1.png'),
                label: 'Saved',
              ),
              BottomNavigationBarItem(
                icon: _selectedTab == 4
                    ? Image.asset('assets/images/profile (1).png')
                    : Image.asset('assets/images/profile.png'),
                label: 'Profile',
              ),
            ],
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: const TextStyle(color: Colors.blue),
            unselectedLabelStyle: const TextStyle(color: Colors.grey),
            backgroundColor: Colors.white,
            showUnselectedLabels: true,
          ),
        ),
      ),
    );
  }

  // Builds an offstage navigator for the specified tab item.
//It ensures that only the navigator for the currently selected tab is visible, while the navigators for other tabs are hidden.
  Widget _buildOffstageNavigator(String tabItem) {
    //used to conditionally hide or show its child widget based on a boolean value
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }
}
