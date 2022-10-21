import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_static_maps_controller/google_static_maps_controller.dart';
import 'package:intl/intl.dart';

import 'package:maps_launcher/maps_launcher.dart';
import 'package:trip_user_app/src/pages/checkout_out_screen.dart';
import 'package:trip_user_app/src/pages/select_time_pitch_group_screen.dart';
import '../../config/routes/app_routes.dart';
import '../elements/rounded_button.dart';
import '../models/trip_model.dart';
import '../utilitis/URL.dart';
import '../utilitis/assets_manger.dart';

class DetailGroupScreen extends StatefulWidget {
  static const String routeName = Routes.detailTripRoute;
  final TripModel tripModel;

  const DetailGroupScreen(this.tripModel, {Key? key}) : super(key: key);

  @override
  State<DetailGroupScreen> createState() => _DetailGroupScreenState();
}

class _DetailGroupScreenState extends State<DetailGroupScreen> {

  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    // tripModel = ModalRoute.of(context)!.settings.arguments as TripModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rihla'),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 111
              Container(
                color: const Color(0xffffffff),
                child: Column(
                  children: [
                    imageSlider(widget.tripModel.images!),
                    // Container(
                    //   width: double.infinity,
                    //   height: 236,
                    //   child: Image.asset('assets/images/image3.png',
                    //       fit: BoxFit.fitWidth),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.tripModel.emirate!.name.toString(),
                              style: const TextStyle(
                                  color: Color(0xff003053),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "PlayfairDisplay",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 30.0),
                              textAlign: TextAlign.left),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              rowLocation(
                                  iconPath: 'grey_location.svg',
                                  title: 'French'),
                              rowLocation(iconPath: 'star.svg', title: '4.9'),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              containerIntent(index: 1, iconPath: 'location.svg'),
                              containerIntent(index: 2, iconPath: 'call.svg'),
                              containerIntent(index: 3, iconPath: 'share.svg'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Rectangle 161
              Container(
                color: const Color(0xfff1f9ff),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Caribbean

                          infoTrip(
                              title: 'Description',
                              subTitle: widget.tripModel.tripDescriptionEn),
                          infoTrip(
                              title: 'Additional Notes',
                              subTitle: widget.tripModel.additionalNotesEn),
                          infoTrip(
                              title: 'Location',
                              subTitle: widget.tripModel.tripLocationEn),

                          infoTrip(
                              title: 'Duration',
                              subTitle: widget.tripModel.tripDurationEn),

                          infoTrip(
                              title: 'Cost',
                              subTitle: "${widget.tripModel.cost} AED"),

                          // Screen Shot 2017-12-01 at 14.01.52
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: GestureDetector(
                              onTap: (){
                                MapsLauncher.launchCoordinates(
                                    double.parse(widget.tripModel.latitude!),
                                    double.parse(widget.tripModel.longitude!));
                              },
                              child: SizedBox(
                                width: double.infinity,
                                height: 173,
                                //color: Colors.grey,
                                child: StaticMap(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  scaleToDevicePixelRatio: true,
                                  googleApiKey: "AIzaSyDQ2c_pOSOFYSjxGMwkFvCVWKjYOM9siow",
                                  // visible: const [
                                  //   GeocodedLocation.address('Santa Monica Pier'),
                                  // ],
                                  zoom: 14,
                                  markers:  <Marker>[
                                    Marker(
                                      color: Colors.red,
                                      locations: [
                                        GeocodedLocation.latLng(
                                            double.parse(widget.tripModel.latitude.toString()),double.parse( widget.tripModel.longitude.toString())),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),


                          RoundedButton(
                            text: 'Next',
                            press: () {

                              // Navigator.push(context, MaterialPageRoute(builder: (context){
                              //   return SelectTimePitchGroupScreen(tripModel : widget.tripModel  , selectedDate : _selectedDate ,selectedTime :  selectedTime);
                              // }));
                              Navigator.pushNamed(
                                  context, SelectTimePitchGroupScreen.routeName);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget rowLocation({required iconPath, required title}) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Row(
        children: [
          SvgPicture.asset(
            SvgAssets.path + iconPath,
          ),
          const SizedBox(
            width: 3,
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
      ),
    );
  }

  Widget containerIntent({required int index, required String iconPath}) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: GestureDetector(
        onTap: () {
          switch (index) {
            case 1:
              MapsLauncher.launchCoordinates(
                  double.parse(widget.tripModel.latitude!),
                  double.parse(widget.tripModel.longitude!));
              // MapUtils.openMap(latitude: widget.tripModel.latitude! ,longitude: widget.tripModel.longitude!);
              break;
            case 2:
              // _service!.call("055203043");
              break;
            case 3:
              //  _service!.sendSms("055203043");
              break;
          }
        },
        child: Container(
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
        ),
      ),
    );
  }

  Widget infoTrip({required title, required subTitle}) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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






  Widget imageSlider(List<Images> images) {
    return Container(
      color: Colors.grey.shade100,
      height: 300,
      child: Stack(
        children: [
          ListView(
            children: [
              CarouselSlider(
                carouselController: _controller,
                items: images
                    .map((item) => SizedBox(
                          height: 300,
                          child: Image.network(
                              Url.baseTripsImageUrl + item.imageUrl.toString(),
                              fit: BoxFit.cover,
                              width: double.infinity),
                        ))
                    .toList(),
                options: CarouselOptions(
                    height: 380.0,
                    enlargeCenterPage: false,
                    autoPlay: true,
                    disableCenter: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.easeInOut,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: images.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 12.0,
                          height: 12.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).primaryColor ==
                                          Brightness.light
                                      ? Colors.white
                                      : Colors.white)
                                  .withOpacity(
                                      _current == entry.key ? 0.9 : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
