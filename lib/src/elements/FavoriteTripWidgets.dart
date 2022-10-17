import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:trip_user_app/src/utilitis/URL.dart';
import 'package:trip_user_app/src/utilitis/toast.dart';
import '../controllers/favorite_provider.dart';
import '../models/favorite_model.dart';
import '../models/trip_model.dart';
import '../pages/detail_trip_screen.dart';

class FavoriteTripWidgets extends StatefulWidget {
  const FavoriteTripWidgets({Key? key}) : super(key: key);

  @override
  State<FavoriteTripWidgets> createState() => _FavoriteTripWidgetsState();
}

class _FavoriteTripWidgetsState extends State<FavoriteTripWidgets> {
  bool isLoadingFavorite = false;
  bool isFavoriteDoctor = false;

  @override
  Widget build(BuildContext context) {
    final favoriteModel = Provider.of<FavoriteModel>(context);
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context){
        //   return DetailTripScreen(TripModel(
        //     additionalNotes:  favoriteModel.trip!.additionalNotes,
        //     tripTitle:  favoriteModel.trip!.tripTitle,
        //     images:  favoriteModel.trip!.images as Images,
        //     longitude:  favoriteModel.trip!.longitude,
        //     latitude:  favoriteModel.trip!.latitude,
        //     cost:  favoriteModel.trip!.cost,
        //     tripDurationEn:  favoriteModel.trip!.tripDurationEn,
        //     tripLocationEn:  favoriteModel.trip!.tripLocationEn,
        //     additionalNotesEn:  favoriteModel.trip!.additionalNotesEn,
        //     tripDescriptionEn:  favoriteModel.trip!.tripDescriptionEn,
        //     emirate:  favoriteModel.trip!.emirate as Emirate,
        //     sId:  favoriteModel.trip!.sId,
        //     isWorkHours:  favoriteModel.trip!.isWorkHours,
        //     company:  favoriteModel.trip!.company as Company ,
        //     iV:  favoriteModel.trip!.iV,
        //     tourismProgram:  favoriteModel.trip!.tourismProgram,
        //     tripDescription:  favoriteModel.trip!.tripDescription,
        //     tripDuration:  favoriteModel.trip!.tripDuration,
        //     tripLocation:  favoriteModel.trip!.tripLocation,
        //     tripTitleEn:  favoriteModel.trip!.tripTitleEn,
        //     workHoursForm:  favoriteModel.trip!.workHoursForm,
        //     workHoursTo:  favoriteModel.trip!.workHoursTo,
        //   )) ;
        // })) ;
        // Navigator.pushNamed(context, DetailTripScreen.routeName , arguments: tripModel.trip) ;
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: const BoxDecoration(color: Color(0xffffffff)),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 240,
              child: Image.network(
                  Url.baseTripsImageUrl +
                      favoriteModel.trip!.images![0].imageUrl.toString(),
                  fit: BoxFit.fitWidth),
            ),
            Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(favoriteModel.trip!.tripTitle.toString(),
                        style: const TextStyle(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 20.0),
                        textAlign: TextAlign.left),
                    rowDetail(
                        imageUrl: 'assets/icons/duration.svg',
                        text: '12 Days'),
                    rowDetail(
                        imageUrl: 'assets/icons/location_trip.svg',
                        text: 'Jumeirah Beach Dubai'),
                  ],
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        isLoadingFavorite = true;
                      });
                      addToFavorite(context, favoriteModel.sId);
                    },
                    child: Container(
                      height: 20,
                      width: 20,
                      child:
                      isFavoriteDoctor ? const Icon(Icons.favorite , color: Colors.red,) : SvgPicture.asset('assets/icons/empty_heart.svg'),
                    )),
          ],
        ),
      ),
      ],
    ),)
    ,
    );
  }

  Widget rowDetail({required String imageUrl, required String text}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            imageUrl,
            height: 19,
            width: 19,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: const TextStyle(
                color: Color(0xff415460),
                fontWeight: FontWeight.w400,
                fontFamily: "Poppins",
                fontStyle: FontStyle.normal,
                fontSize: 10.0),
          )
        ],
      ),
    );
  }

  Future<void> addToFavorite(BuildContext context, var tripId) async {
    try {
      Map<String, dynamic>? response =
      await (Provider.of<ProviderFavorite>(context, listen: false)
          .addFavoriteTripApi(tripId));
      print("res s");
      print(response);
      if (response!['success'] == true) {
        // SharedPreferences preferences = await SharedPreferences.getInstance();
        //  preferences.setBool("seenAuth" , true);
        // await _progressDialog.hide();
        successToast(context, 'Done Remove');
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
