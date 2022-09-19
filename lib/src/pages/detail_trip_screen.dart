import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trip_user_app/core/utils/assets_manger.dart';

import '../elements/rounded_button.dart';

class DetailTripScreen extends StatefulWidget {
  const DetailTripScreen({Key? key}) : super(key: key);

  @override
  State<DetailTripScreen> createState() => _DetailTripScreenState();
}

class _DetailTripScreenState extends State<DetailTripScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rihla'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            // 111
            Container(
              width: double.infinity,
              height: 236,
              child: Image.asset('assets/images/trip.png'),
            ),
            // Rectangle 161
            Container(
              width: double.infinity,
              // height: 236,
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Color(0x17003053),
                    offset: Offset(0, 0),
                    blurRadius: 30,
                    spreadRadius: 0)
              ], color: Color(0xffffffff)),
              child: Row(
                children: [
                  Column(
                    children: [
                      // Caribbean
                      const Text("Caribbean",
                          style: TextStyle(
                              color: Color(0xff003053),
                              fontWeight: FontWeight.w700,
                              fontFamily: "PlayfairDisplay",
                              fontStyle: FontStyle.normal,
                              fontSize: 30.0),
                          textAlign: TextAlign.left),

                      Row(
                        children: [
                          rowLocation(
                              iconPath: 'grey_location.svg', title: 'French'),
                          rowLocation(iconPath: 'star.svg', title: '4.9'),
                        ],
                      ),

                      Row(
                        children: [
                          containerIntent(iconPath: 'location.svg'),
                          containerIntent(iconPath: 'call.svg'),
                          containerIntent(iconPath: 'share.svg'),
                        ],
                      ),

                      infoTrip(
                          title: 'Duration',
                          subTitle:
                              'The Caribbean is a region of the Americas that consists of the Caribbean Sea, its islands andthe surrounding coasts.'),
                      infoTrip(
                          title: 'Duration',
                          subTitle:
                              'The Caribbean is a region of the Americas that consists of the Caribbean Sea, its islands andthe surrounding coasts.'),
                      infoTrip(
                          title: 'Duration',
                          subTitle:
                              'The Caribbean is a region of the Americas that consists of the Caribbean Sea, its islands andthe surrounding coasts.'),

                      // Screen Shot 2017-12-01 at 14.01.52
                      Container(
                        width: double.infinity,
                        height: 173,
                        color: Colors.grey,
                      ),

                      titleSelectTime(text: 'Select Data'),

                      titleSelectTime(text: 'Select Time'),


                      titleSelectTime(text: 'Number of quest'),


                      const RoundedButton(text:  'Book Now' ) ,
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget rowLocation({required iconPath, required title}) {
    return Row(
      children: [
        SvgPicture.asset(
          SvgAssets.path + iconPath,
        ),
        const SizedBox(
          width: 12,
        ),
        const Text("4.9",
            style: TextStyle(
                color: Color(0xff212c3f),
                fontWeight: FontWeight.w500,
                fontFamily: "Lato",
                fontStyle: FontStyle.normal,
                fontSize: 18.0),
            textAlign: TextAlign.left)
      ],
    );
  }

  Widget containerIntent({required iconPath}) {
    return Container(
      width: 42,
      height: 42,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(21)),
          color: Color(0xff0081df)),
      child: Center(
        child: SvgPicture.asset(
          SvgAssets.path + iconPath,
        ),
      ),
    );
  }

  Widget infoTrip({required title, required subTitle}) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          // Description
          Text(title,
              style: const TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppins",
                  fontStyle: FontStyle.normal,
                  fontSize: 22.0),
              textAlign: TextAlign.left),
          const SizedBox(
            height: 13,
          ),
          // The Caribbean is a region of the Americas that consists of the Caribbean Sea, its islands and the surrounding coasts.
          Text(subTitle,
              style: const TextStyle(
                  color: Color(0xff415460),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Poppins",
                  fontStyle: FontStyle.normal,
                  fontSize: 14.0),
              textAlign: TextAlign.left)
        ],
      ),
    );
  }

  Widget titleSelectTime({required text}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(text,
          style: const TextStyle(
              color: Color(0xff0081df),
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
              fontStyle: FontStyle.normal,
              fontSize: 14.0),
          textAlign: TextAlign.left),
    );
  }
}
