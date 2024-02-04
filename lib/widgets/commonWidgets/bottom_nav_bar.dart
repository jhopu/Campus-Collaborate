import 'package:campus_collaborate/constants/themes.dart';
import 'package:campus_collaborate/screens/home_screen.dart';
import 'package:campus_collaborate/screens/test_screen.dart';
import 'package:campus_collaborate/services/nav_bar_services.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller = PersistentTabController(initialIndex: 0);
    return Consumer<NavBarService>(
      builder: (context, navBarService, child){
        return PersistentTabView(
          context,
          backgroundColor: Themes.getColors(ColorsValues.DARK_GREY_COLOR),
          decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(15.0)
          ),
          navBarHeight: 65,
          navBarStyle: NavBarStyle.style7,
          items: [
            PersistentBottomNavBarItem(icon: const Icon(Icons.home),
                activeColorPrimary: Themes.getColors(ColorsValues.ORANGE_COLOR),
              activeColorSecondary: Colors.black,
              inactiveColorPrimary: Colors.black
            ),
            PersistentBottomNavBarItem(icon: const Icon(Icons.post_add),
                activeColorPrimary: Themes.getColors(ColorsValues.ORANGE_COLOR),
                activeColorSecondary: Colors.black,
                inactiveColorPrimary: Colors.black
            ),
            PersistentBottomNavBarItem(icon: const Icon(Icons.handshake),
                activeColorPrimary: Themes.getColors(ColorsValues.ORANGE_COLOR),
                activeColorSecondary: Colors.black,
                inactiveColorPrimary: Colors.black
            ),
            PersistentBottomNavBarItem(icon: const Icon(Icons.chat),
                activeColorPrimary: Themes.getColors(ColorsValues.ORANGE_COLOR),
                activeColorSecondary: Colors.black,
                inactiveColorPrimary: Colors.black
            )
          ],
          controller: _controller,
          screens: [
              TestScreen(),
            TestScreen(),
            TestScreen(),
            TestScreen()
          ],
        );
      }
    );
  }
}
