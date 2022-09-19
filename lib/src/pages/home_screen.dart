import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/utils/assets_manger.dart';

class HomeScreen extends StatefulWidget {
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
          child: Column(
        children: [
          // Rectangle 1
          Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 18.0),
              // width: 372,
              // height: 51,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: Color(0xffffffff)),
              child: Column(
                children: [
                  SvgPicture.asset(
                    SvgAssets.path + 'search.svg',
                  ),
                  // See All
                  const Text("Search trip",
                      style: TextStyle(
                          color: Color(0x8a4e6772),
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          fontSize: 15.0),
                      textAlign: TextAlign.left),
                ],
              )),
        ],
      )),
    );
  }
}
