import 'package:flutter/material.dart';
import 'package:flutter_app/app_colors.dart';
import 'package:flutter_app/dialog/photo_dialog.dart';
import 'package:flutter_app/screens/home_views/dashboard.dart';
import 'package:flutter_app/screens/home_views/history.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);
  int lastIndex = 0;

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.index == 1) {
        _showPhotoDialog();
        _controller.jumpToTab(lastIndex);
      } else {
        lastIndex = _controller.index;
      }
    });
    super.initState();
  }

  void _showPhotoDialog() {
    showDialog(context: context, builder: (context) => const PhotoDialog());
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_rounded),
        title: ("Home"),
        activeColorPrimary: AppColor.normalGreen,
        inactiveColorPrimary: Colors.black
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.add_a_photo_rounded, color: Colors.white),
        title: ("Scan Receipt"),
        activeColorPrimary: AppColor.normalGreen,
        inactiveColorPrimary: Colors.black
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.history_rounded),
        title: ("Settings"),
        activeColorPrimary: AppColor.normalGreen,
        inactiveColorPrimary: Colors.black
      ),
    ];
  }

  List<Widget> _buildScreens() {
      return [
        const Dashboard(),
        const SizedBox(),
        const History()
      ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: Colors.white, // Default is Colors.white.
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style15, // Choose the nav bar style with this property.
      ),
    );
  }
}
