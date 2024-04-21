import 'package:flutter/material.dart';
import 'package:homeservice/core/utilti/Color.dart';
import 'package:homeservice/view/screen/appointment.dart';
import 'package:homeservice/view/screen/home_page_provider.dart';
import 'package:homeservice/view/screen/reservation_provider.dart';
import 'package:homeservice/view/screen/settings_app.dart';
class Navbar_Provider extends StatefulWidget {
  const Navbar_Provider({super.key});

  @override
  State<Navbar_Provider> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar_Provider> {
  List<Widget> pageWidget = [
    const HomePageProvider(),
    const reservation_provider(),
    const Text("data"),
    const Account(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> items;
    items = [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.calendar_month_outlined,
          ),
          label: 'الحجوزات'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.notifications), label: 'اشعارات'),
      const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'الحساب'),
    ];
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: items,
          selectedItemColor: mainColor,
          unselectedItemColor: const Color(0xAA8C8787),
          elevation: 10,
          // showSelectedLabels: true,
          showUnselectedLabels: true,
          // selectedFontSize: 14,
          // unselectedFontSize: 12,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
            print(index);
          },
        ),
        body: pageWidget[selectedIndex]);
  }
}