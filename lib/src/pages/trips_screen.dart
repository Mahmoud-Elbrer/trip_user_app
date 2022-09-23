import 'package:flutter/material.dart';
import 'package:trip_user_app/src/elements/TripWidgets.dart';

import '../../config/routes/app_routes.dart';

class TripsScreen extends StatefulWidget {
  static const routeName = Routes.tripsRoute;

  const TripsScreen({Key? key}) : super(key: key);

  @override
  State<TripsScreen> createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(title: Text('Trips')),
      body: Container(
        color: const Color(0xfff1f9ff),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: const [
                TripWidgets(text: 'Dubai' ,  imagePath: 'assets/images/image.jpg',),
                TripWidgets(text: 'Burj Khalifa' ,  imagePath: 'assets/images/image3.png',),
                TripWidgets(text: 'Dubai' ,  imagePath: 'assets/images/image.jpg',),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
