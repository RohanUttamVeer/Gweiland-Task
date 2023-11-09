import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../controller/home_controller.dart';

class HomeNav extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        child: PersistentTabView(
          context,
          controller: controller.controller,
          screens: controller.buildScreens(),
          items: controller.navBarsItems(),
          confineInSafeArea: true,
          margin: EdgeInsets.all(8),
          backgroundColor: Colors.black,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardShows: true,
          navBarHeight: 80,
          bottomScreenMargin: 0,
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          decoration: NavBarDecoration(borderRadius: BorderRadius.circular(20)),
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style6,
        ),
      ),
    );
  }
}
