import 'package:flutter/material.dart';
import 'package:instagram_ui_one/data/constant/constants.dart';
import 'package:instagram_ui_one/screens/activity_screen.dart';
import 'package:instagram_ui_one/screens/add_content_screen.dart';
import 'package:instagram_ui_one/screens/home_page.dart';
import 'package:instagram_ui_one/screens/profile_user.dart';
import 'package:instagram_ui_one/screens/searchScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectBottomNavigationBar = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xff272B40),
          currentIndex: _selectBottomNavigationBar,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (int index) {
            setState(() {
              _selectBottomNavigationBar = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: Image.asset(
                'images/icon_home.png',
              ),
              activeIcon: Image.asset(
                'images/icon_active_home.png',
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Image.asset(
                'images/icon_search_navigation.png',
              ),
              activeIcon: Image.asset(
                'images/icon_search_navigation_active.png',
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Image.asset(
                'images/icon_add_navigation.png',
              ),
              activeIcon: Image.asset(
                'images/icon_add_navigation_active.png',
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Image.asset(
                'images/icon_activity_navigation.png',
              ),
              activeIcon: Image.asset(
                'images/icon_activity_navigation_active.png',
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Container(
                width: 33,
                height: 33,
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor, width: 2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Padding(
                  padding: EdgeInsets.all(1),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset('images/profile.png'),
                    ),
                  ),
                ),
              ),
              activeIcon: Container(
                width: 33,
                height: 33,
                decoration: BoxDecoration(
                  border: Border.all(color: pinkColor, width: 2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Padding(
                  padding: EdgeInsets.all(1),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset('images/profile.png'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectBottomNavigationBar,
        children: _getLayour(),
      ),
    );
  }

  List<Widget> _getLayour() {
    return <Widget>[
      HomePage(),
      SearchScreen(),
      PostScreen(),
      ActivityScreen(),
      ProfileUser(),
    ];
  }
}
