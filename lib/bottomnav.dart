import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techvillage/Services/service_page.dart';
import 'package:techvillage/screens/home.dart';
import 'package:techvillage/products/products.dart';
import 'package:techvillage/screens/user_profile.dart';

class BottomNav extends StatefulWidget {

  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List screens = const[
    HomeScreen(),
    ProductsPage(),
    ServicePage(),
    TechVillageProfilePage(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/products.svg',
                width: 23,
                height: 23,
                color: selectedIndex == 1
                    ? const Color.fromRGBO(62, 202, 59, 100)
                    : Colors.black,
              ),
              label: 'Products'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/services.svg',
                width: 23,
                height: 23,
                color: selectedIndex == 2
                    ? const Color.fromRGBO(62, 202, 59, 100)
                    : Colors.black,
              ),
              label: 'Services'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: 'Profile'),
        ],
        selectedItemColor:   const Color.fromRGBO(62, 202, 59, 100),
        unselectedItemColor: Colors.black,
      ),
  
    );
  }
}
