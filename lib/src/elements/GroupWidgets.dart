import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:trip_user_app/src/utilitis/URL.dart';
import 'package:trip_user_app/src/utilitis/toast.dart';
import '../controllers/favorite_provider.dart';
import '../models/trip_model.dart';
import '../pages/detail_group_screen.dart';

class GroupWidget extends StatefulWidget {
  const GroupWidget({Key? key}) : super(key: key);

  @override
  State<GroupWidget> createState() => _GroupWidgetState();
}

class _GroupWidgetState extends State<GroupWidget> {
  bool isLoadingFavorite = false;
  bool isFavoriteDoctor = false;

  @override
  Widget build(BuildContext context) {
    final tripModel = Provider.of<TripModel>(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailGroupScreen(tripModel);
        }));
      },
      child: Card(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          //decoration: const BoxDecoration(color: Color(0xffffffff)),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 240,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                      image: NetworkImage(Url.baseTripsImageUrl +
                          tripModel.images![0].imageUrl.toString())),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: const Icon(
                                Icons.sports_baseball_sharp,
                                color: Colors.black,
                              ))),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   width: double.infinity,
              //   height: 240,
              //   child: Stack(
              //     children: [
              //      const  Align( alignment:  Alignment.bottomRight, child: Icon(Icons.sports_football ,color: Colors.red,)),
              //       Image.network(Url.baseTripsImageUrl + tripModel.images![0].imageUrl.toString()  ,fit:  BoxFit.fitWidth),
              //     ],
              //   ),
              // ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 0),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tripModel.tripTitle.toString(),
                            style: const TextStyle(
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w500,
                                // //fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 20.0),
                            textAlign: TextAlign.left),
                        rowDetail(
                            imageUrl: 'assets/icons/location_trip.svg',
                            text: tripModel.tripLocationEn.toString()),
                        rowDetail(
                            imageUrl: 'assets/icons/location_trip.svg',
                            text: '3 playgrounds'),
                      ],
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            isLoadingFavorite = true;
                          });
                          addToFavorite(
                              context, "widget.doctorDetailsModel!.id");
                        },
                        child: SizedBox(
                            child: SvgPicture.asset(
                          'assets/icons/mark.svg',
                          height: 20,
                          width: 20,
                        ))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget rowDetail({required String imageUrl, required String text}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
                color: Color(0xff415460),
                fontWeight: FontWeight.w400,
                //fontFamily: "Poppins",
                fontStyle: FontStyle.normal,
                fontSize: 12.0),
          )
        ],
      ),
    );
  }

  Future<void> addToFavorite(BuildContext context, var doctorId) async {
    try {
      Map<String, dynamic>? response =
          await (Provider.of<ProviderFavorite>(context, listen: false)
              .addFavoriteTripApi(doctorId));
      ////print("res s");
      ////print(response);
      if (response!['code'] == 200) {
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
