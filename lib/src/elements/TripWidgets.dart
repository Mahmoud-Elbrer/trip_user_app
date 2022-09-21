import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TripWidgets extends StatelessWidget {
  final String imagePath ;
  final String text ;

  const TripWidgets({super.key, required this.imagePath, required this.text});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: const BoxDecoration(color: Color(0xffffffff)),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 240,
            child: Image.asset(imagePath ,fit:  BoxFit.fitWidth),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(text,
                        style: const  TextStyle(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 20.0),
                        textAlign: TextAlign.left),
                    rowDetail(imageUrl:  'assets/icons/duration.svg' , text:  '12 Days'),
                    rowDetail(imageUrl:  'assets/icons/location_trip.svg' , text:  'Jumeirah Beach Dubai'),
                  ],
                ),
                SvgPicture.asset( 'assets/icons/empty_heart.svg' , height: 20 , width: 20,) ,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget rowDetail({required String imageUrl , required  String  text  }){
    return   Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(imageUrl  , height: 19  ,width: 19,),
          const SizedBox(width: 10,) ,
          Text(text,
              style: const TextStyle(
                  color:  Color(0xff415460),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Poppins",
                  fontStyle: FontStyle.normal,
                  fontSize: 10.0),
            )
        ],
      ),
    ) ;
  }
}
