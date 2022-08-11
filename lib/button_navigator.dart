import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'Screens/cards.dart';
import 'Screens/home.dart';
import 'Screens/profile.dart';

class ButtonNavigator extends StatefulWidget {
  const ButtonNavigator({Key? key}) : super(key: key);

  @override
  State<ButtonNavigator> createState() => _ButtonNavigatorState();
}

class _ButtonNavigatorState extends State<ButtonNavigator> {
  List<Widget> changePage = [
    const HomeScreen(),
    const CreditCards(),
    const ProfilePage(),
  ];
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: const Color.fromARGB(255, 40, 37, 92),
        animationCurve: Curves.easeInOut,
        buttonBackgroundColor: Colors.transparent,
        items: const [
          Icon(
            Icons.house_outlined,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.credit_card,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.person_outline,
            size: 30,
            color: Colors.white,
          ),
        ],
        index: page,
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
      ),
      body: changePage[page],
    );
  }
}
