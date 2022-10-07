import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:trip_user_app/src/pages/checkout_out_screen.dart';

import '../../config/routes/app_routes.dart';
import '../elements/rounded_button.dart';
import '../models/trip_model.dart';
import '../utilitis/assets_manger.dart';

class DetailTripScreen extends StatefulWidget {
  static const String routeName = Routes.detailTripRoute;
 final TripModel tripModel ;
  const DetailTripScreen( this.tripModel, {Key? key}) : super(key: key);

  @override
  State<DetailTripScreen> createState() => _DetailTripScreenState();
}

class _DetailTripScreenState extends State<DetailTripScreen> {
  String _selectedDate = 'Tap to select date';
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (d != null) {
      setState(() {
        _selectedDate = DateFormat.yMMMMd("en_US").format(d);
      });
    }
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }
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
                    Container(
                      width: double.infinity,
                      height: 236,
                      child: Image.asset('assets/images/image3.png',
                          fit: BoxFit.fitWidth),
                    ),
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
                              containerIntent(iconPath: 'location.svg'),
                              containerIntent(iconPath: 'call.svg'),
                              containerIntent(iconPath: 'share.svg'),
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
                        children: [
                          // Caribbean

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
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Container(
                              width: double.infinity,
                              height: 173,
                              color: Colors.grey,
                            ),
                          ),

                          titleSelectTime(text: 'Select Data'),

                          selectDatePicker(),

                          titleSelectTime(text: 'Select Time'),

                          selectTimePicker(),

                          titleSelectTime(text: 'Number of quest'),

                          selectQuestContainer(),

                           RoundedButton(text: 'Next'  , press: (){
                             Navigator.pushNamed(context, CheckoutOutScreen.routeName) ;
                           },),
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

  Widget containerIntent({required iconPath}) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
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

  Widget titleSelectTime({required text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Text(text,
              style: const TextStyle(
                  color: Color(0xff0081df),
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppins",
                  fontStyle: FontStyle.normal,
                  fontSize: 14.0),
              textAlign: TextAlign.left),
        ),
      ],
    );
  }

  Widget selectQuestContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: double.infinity,
      //margin: ,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Color(0xffffffff)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Deluxe Twin Room
          const Text("Number of questSingle Room",
              style: TextStyle(
                  color: Color(0xff24253d),
                  fontWeight: FontWeight.w700,
                  fontFamily: "Montserrat",
                  fontStyle: FontStyle.normal,
                  fontSize: 12.0),
              textAlign: TextAlign.left),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: const [
                  // 2 double beds 2 room
                  Text("0 Adult",
                      style: TextStyle(
                          color: Color(0x8024253d),
                          fontWeight: FontWeight.w500,
                          fontFamily: "Lato",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0),
                      textAlign: TextAlign.left),
                  // 2 double beds 2 room
                  Text("0 Child",
                      style: TextStyle(
                          color: Color(0x8024253d),
                          fontWeight: FontWeight.w500,
                          fontFamily: "Lato",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0),
                      textAlign: TextAlign.left)
                ],
              ),
              // Rectangle 5
              Container(
                width: 113,
                height: 41,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Color(0xff3389ee)),
                child: const Center(
                  child: Text("ADD",
                          style: TextStyle(
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w400,
                              fontFamily: "Montserrat",
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.center),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget selectDatePicker() {
    return GestureDetector(
      onTap: () {
        _selectDate(context);
      },
      child: Container(
        width: double.infinity,
        height: 51,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color(0xffffffff)),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      SvgAssets.path + 'calender.svg',
                    ),
                    const SizedBox(
                      width: 14,
                    ),
// See All
                    Text(_selectedDate,
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
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: SvgPicture.asset(
                SvgAssets.path + 'down-arrow.svg',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget selectTimePicker() {
    return GestureDetector(
      onTap: () {
        _selectTime(context);
      },
      child: Container(
        width: double.infinity,
        height: 51,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: Color(0xffffffff)),
        child: Row(
          children: [
            SvgPicture.asset(
              SvgAssets.path + 'calender.svg',
            ),
            const SizedBox(
              width: 14,
            ),
// See All
            Text(selectedTime.hour.toString() + " : ".toString() +  selectedTime.minute.toString() ,
                style: const TextStyle(
                    color: Color(0x8a4e6772),
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.normal,
                    fontSize: 15.0),
                textAlign: TextAlign.left)
          ],
        ),
      ),
    );
  }
}
