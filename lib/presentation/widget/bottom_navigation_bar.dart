import 'package:flutter/material.dart';
import '../../core/util/constants.dart';
import '../view/posts_screen.dart';
import '../view/users_screen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final List<Widget> _screens = [
    const UsersScreen(),
    const PostsScreen(),
  ];
  final Map<String, IconData> _screenIcons = const {
    Strings.bottomNavBarUserText: Icons.person,
    Strings.bottomNavBarPostText: Icons.receipt,
  };
  int _currentIndex = Dimensions.navRouterCurrentIndexStart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Palette.bottomNavBarBorder,
              width: Dimensions.bottomNavBarBorderWidth,
            ),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Palette.bottomNavBarBackground,
          items: _screenIcons
              .map(
                (title, icon) => MapEntry(
                  title,
                  BottomNavigationBarItem(
                    icon: Icon(
                      icon,
                      size: Dimensions.bottomNavBarIconSize,
                    ),
                    label: title,
                  ),
                ),
              )
              .values
              .toList(),
          currentIndex: _currentIndex,
          onTap: (index) => setState(
            () => _currentIndex = index,
          ),
          selectedItemColor: Palette.bottomNavBarUserSelectedItem,
          unselectedItemColor: Palette.bottomNavBarUserUnselectedItem,
        ),
      ),
    );
  }
}
