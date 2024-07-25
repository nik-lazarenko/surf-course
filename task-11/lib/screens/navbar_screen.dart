import 'package:flutter/material.dart';
import '../assets/text_strings.dart';
import '/assets/colors.dart';
import '/assets/text_styles.dart';
import '/screens/empty_screen.dart';
import '/screens/home_screen.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});
  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int _currentIndex = 3;
  final List<Widget> _pages = const [
    EmptyScreen(),
    EmptyScreen(),
    EmptyScreen(),
    HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_rounded), label: AppTexts.catalogue),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: AppTexts.search),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: AppTexts.basket),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: AppTexts.personal),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        selectedItemColor: theme.primaryColor,
        selectedLabelStyle: AppTextStyles.navBar,
      ),
    );
  }
}