import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:trip_user_app/src/utilitis/toast.dart';

import '../controllers/favorite_provider.dart';
import '../pages/detail_trip_screen.dart';

class TripWidgets extends StatefulWidget {
  final String imagePath ;
  final String text ;

  const TripWidgets({super.key, required this.imagePath, required this.text});

  @override
  State<TripWidgets> createState() => _TripWidgetsState();
}

class _TripWidgetsState extends State<TripWidgets> {


  bool isLoadingFavorite = false;
  bool isFavoriteDoctor = false;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, DetailTripScreen.routeName) ;
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: const BoxDecoration(color: Color(0xffffffff)),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 240,
              child: Image.asset(widget.imagePath ,fit:  BoxFit.fitWidth),
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
                       Text(widget.text,
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
                  GestureDetector( onTap: (){
                    setState(() {
                      isLoadingFavorite = true;
                    });
                    addToFavorite(context, "widget.doctorDetailsModel!.id");
                  }, child: Container(child: SvgPicture.asset( 'assets/icons/empty_heart.svg' , height: 20 , width: 20,))) ,
                ],
              ),
            ),
          ],
        ),
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


  Future<void> addToFavorite(BuildContext context, var doctorId) async {
    try {
      Map<String, dynamic> response =
      await (Provider.of<ProviderFavorite>(context, listen: false)
          .addFavoriteTripApi(doctorId) as Future<Map<String, dynamic>>);
      ////print("res s");
      ////print(response);
      if (response['code'] == 200 || response['code'] < 300) {
        // SharedPreferences preferences = await SharedPreferences.getInstance();
        //  preferences.setBool("seenAuth" , true);
        // await _progressDialog.hide();
        successToast(context, 'description');
        setState(() {
          isFavoriteDoctor = true;
        });
      } else {
        // await _progressDialog.hide();
      //  failToast(context, getTranslationLanguage(response['description'])!);
       // showAlert(context, getTranslated(context, 'alert'), getTranslationLanguage(response['description']));
      }

      setState(() {
        isLoadingFavorite = false;
      });
    } on HttpException catch (error) {
      error.toString();
      setState(() {
        isLoadingFavorite = false;
      });
      // await _progressDialog.hide();
     // showAlert(context, getTranslated(context, 'alert'), getTranslated(context, 'error_occurred'));
    } catch (error) {
      setState(() {
        isLoadingFavorite = false;
      });
      // await _progressDialog.hide();
      //showAlert(context, getTranslated(context, 'alert'), getTranslated(context, 'check_for_internet_connection'));
      ////print("fail 2");
      ////print(errorMessage);
    }
  }
}
