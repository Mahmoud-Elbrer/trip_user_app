import 'package:flutter/material.dart';

class TripHomeWidget extends StatelessWidget {
  final String imagePath;

  final String title;

  const TripHomeWidget(
      {super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        width: 249,
        height: 411,
        decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(
              Radius.circular(23),
            )),
        child: Image.asset(imagePath,
            fit: BoxFit.fitHeight, filterQuality: FilterQuality.high),
      ),
    );
  }
}


/*
 Column(
                children: const [
                  // Caribbean
                  Text("Dobai",
                      style: TextStyle(
                          color: Color(0xff354751),
                          fontWeight: FontWeight.w700,
                          fontFamily: "PlayfairDisplay",
                          fontStyle: FontStyle.normal,
                          fontSize: 30.0),
                      textAlign: TextAlign.left),
                  // French
                  Text("French",
                      style: TextStyle(
                          color: Color(0xff354751),
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          fontSize: 19.0),
                      textAlign: TextAlign.left)
                ],
              ),
 */
