import 'package:flutter/material.dart';
import 'package:trip_user_app/src/pages/bottom_navigation_screen.dart';
import 'package:trip_user_app/src/pages/trips_screen.dart';

import 'config/routes/app_routes.dart';


class TabBarDemo extends StatefulWidget {
  static const String  routeName  = Routes.tabBarRoute;
  const TabBarDemo({Key? key}) : super(key: key);

  @override
  _TabBarDemoState createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  int _selectedIndex = 0;

  List<Widget> list = [
   // Tab(icon: Icon(Icons.card_travel)),
    const Tab(text: 'All' ),
    const Tab(text: 'Abu Dhabi'),
    const Tab(text: 'Dubai'),
    const Tab(text: 'Sharjah'),
    const Tab(text: 'Ajman'),
    const Tab(text: 'Umm Al Quwain'),
    const Tab(text: 'Ras Al Khaimah'),
    const Tab(text: 'Fujairah'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: list.length, vsync: this );

    _controller!.addListener(() {
      setState(() {
        _selectedIndex = _controller!.index;
      });
      print("Selected Index: " + _controller!.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            isScrollable: true,
            onTap: (index) {
              // Should not used it as it only called when tab options are clicked,
              // not when user swapped
            },
            controller: _controller,
            tabs: list,
          ),
          centerTitle: true,
          title: Text('Trips'),
        ),

        body: TabBarView(
          controller: _controller,
          children: [
            TripsScreen(),
            Center(
                child: Text(
                 '',
                  style: TextStyle(fontSize: 40),
                )),
            Center(
                child: Text(
                  '',
                  style: TextStyle(fontSize: 40),
                )),
            Center(
                child: Text(
                  '',
                  style: TextStyle(fontSize: 40),
                )),
            Center(
                child: Text(
                  '',
                  style: TextStyle(fontSize: 40),
                )),
            Center(
                child: Text(
                  '',
                  style: TextStyle(fontSize: 40),
                )),
            Center(
                child: Text(
                  '',
                  style: TextStyle(fontSize: 40),
                )),
            Center(
                child: Text(
                  '',
                  style: TextStyle(fontSize: 40),
                )),

          ],
        ),
      ),
    );
  }
}