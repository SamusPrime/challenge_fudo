import 'package:flutter/material.dart';
import '../../core/util/constants.dart';
import '../../presentation/widget/widgets.dart';
import '../../presentation/view/screen.dart';

class NavRouter extends StatefulWidget {
  const NavRouter({Key? key}) : super(key: key);

  @override
  State<NavRouter> createState() => _NavRouterState();
}

class _NavRouterState extends State<NavRouter> {
  final List<Widget> _screens = [
    //  const LoginScreen(),
    const UsersScreen(),
    const PostsScreen(),
    //  const PostCreationScreen(),
  ];
  final Map<String, IconData> _screenIcons = const {
    // 'Login': Icons.login,
    'Usuarios': Icons.person,
    'Posts': Icons.post_add,
    // 'PostCreation': Icons.post_add_outlined,
  };
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: ConstantsPalette.usersBottomNavBarBorder,
              width: ConstantsDimension.usersBottomNavBarBorderWidth,
            ),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: ConstantsPalette.usersBottomNavBarBackground,
          items: _screenIcons
              .map(
                (title, icon) => MapEntry(
                  title,
                  BottomNavigationBarItem(
                    icon: Icon(icon, size: 30.0),
                    label: title,
                  ),
                ),
              )
              .values
              .toList(),
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          selectedItemColor: ConstantsPalette.usersBottomNavBarUserSelectedItem,
          unselectedItemColor:
              ConstantsPalette.usersBottomNavBarUserUnselectedItem,
        ),
      ),
    );
  }
}
