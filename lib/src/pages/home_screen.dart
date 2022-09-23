import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trip_user_app/src/pages/trips_screen.dart';

import '../../config/routes/app_routes.dart';
import '../../core/utils/assets_manger.dart';
import '../../test.dart';
import '../elements/rounded_textfield.dart';
import '../elements/trip_home_widget.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = Routes.homeRoute;

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Rihla",
            style: TextStyle(
                color: Color(0xff02376d),
                fontWeight: FontWeight.w400,
                fontFamily: "AdobeDevanagari",
                fontStyle: FontStyle.normal,
                fontSize: 26.0),
            textAlign: TextAlign.left),
      ),
      body: Container(
          color: const Color(0xfff1f9ff),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // Rectangle 1
                const RoundedTextField(text: 'Search trip'),
                Column(
                  children: [
                    rowContainer(
                        text: 'Types of tourism',
                        imagePath: 'plane_fly.svg',
                        suffixIcon: 'down_arrow-com.svg'),
                    rowContainer(
                        text: 'Tour Programs',
                        imagePath: 'trip.svg',
                        suffixIcon: 'down_arrow-com.svg'),
                  ],
                ),

                rowTextShowAll(),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                     TripHomeWidget(title: 'Dubai' ,  imagePath: 'assets/images/image.jpg',),
                     TripHomeWidget(title: 'Burj Khalifa' ,  imagePath: 'assets/images/image2.webp',),
                     TripHomeWidget(title: '' ,  imagePath: 'assets/images/image.jpg',),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget rowContainer(
      {required String imagePath,
      required String text,
      required String suffixIcon}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: double.infinity,
        height: 51,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: Color(0xffffffff)),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  SvgPicture.asset(
                    SvgAssets.path + imagePath,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  // See All
                  Text(text,
                      style: const TextStyle(
                          color: Color(0x8a4e6772),
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          fontSize: 15.0),
                      textAlign: TextAlign.left),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SvgPicture.asset(
                SvgAssets.path + suffixIcon,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rowTextShowAll() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 10, left: 5, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
// Destinations
          Text("Destinations",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppins",
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0),
              textAlign: TextAlign.left),
// See All
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, TabBarDemo.routeName) ;
            },
            child: Text("See All",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.normal,
                    fontSize: 15.0),
                textAlign: TextAlign.left),
          )
        ],
      ),
    );
  }

}
