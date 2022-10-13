import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/trip_provider.dart';
import '../models/trip_model.dart';
import '../pages/detail_trip_screen.dart';
import '../utilitis/URL.dart';

class TripHomeWidget extends StatelessWidget {
  const TripHomeWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final tripModel = Provider.of<TripModel>(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return DetailTripScreen(tripModel) ;
            })) ;
           // Navigator.pushNamed(context, DetailTripScreen(tripModel)  ) ;
          },
          child: Container(
            width: 249,
            height: 411,
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                )),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              // tripModel.images[0].imageUrl.toString()
              child: Image.network(Url.baseTripsImageUrl + tripModel.images![0].imageUrl.toString() ,
                  fit: BoxFit.fitHeight, filterQuality: FilterQuality.high),
            ),
          ),
        ),
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
