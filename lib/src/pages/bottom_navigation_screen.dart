import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:trip_user_app/src/pages/favorite_screen.dart';
import 'package:trip_user_app/src/pages/home_screen.dart';
import 'package:trip_user_app/src/pages/profile_screen.dart';

import '../../config/routes/app_routes.dart';
import '../utilitis/DrawerWidget.dart';

class BottomNavigationScreen extends StatefulWidget {

  static const String  routeName  = Routes.bottomNavigationRoute;

  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 25, fontWeight: FontWeight.w600);
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text(
  //     'Home',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Favorite',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Profile',
  //     style: optionStyle,
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme:const IconThemeData(color: Colors.black),
       // leading: const Icon(Icons.search , color: Colors.black,) ,
        title: const Text("Rihla",
            style: TextStyle(
                color: Color(0xff02376d),
                fontWeight: FontWeight.w400,
                //fontFamily: "AdobeDevanagari",
                fontStyle: FontStyle.normal,
                fontSize: 26.0),
            textAlign: TextAlign.left),
      ),
      backgroundColor: Colors.white,
      drawer:const  DrawerWidget(),
      body: Center(
        child: getScreen(selectedIndex: _selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xfff1f9ff),
          // boxShadow: [
          //   BoxShadow(
          //     blurRadius: 20,
          //     color: Colors.black.withOpacity(.1),
          //   )
          // ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              haptic: true,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Theme.of(context).primaryColor,
              textStyle: const TextStyle(color: Colors.white),
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                  textStyle: TextStyle(fontSize: 14),
                ),
                GButton(
                  icon: Icons.favorite_border,
                  text: 'Favorite',
                  textStyle: TextStyle(fontSize: 14),
                ),
                GButton(
                  icon: Icons.person_outlined,
                  text: 'Profile',
                  textStyle: TextStyle(fontSize: 14),
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  getScreen({required int selectedIndex}) {
    switch (selectedIndex) {
      case 0:
        return const HomeScreen();
        break;
      case 1:
        return const FavoriteScreen();
        break;
      case 2:
        return const ProfileScreen();
        break;
    }
  }
}
