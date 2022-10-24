import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trip_user_app/src/elements/rounded_button.dart';

import '../models/timetable_group_view_model.dart';

class SelectTimePitchGroupWidget extends StatefulWidget {
  const SelectTimePitchGroupWidget({Key? key}) : super(key: key);

  @override
  State<SelectTimePitchGroupWidget> createState() => _SelectTimePitchGroupWidgetState();
}

class _SelectTimePitchGroupWidgetState extends State<SelectTimePitchGroupWidget> {
  @override
  Widget build(BuildContext context) {
    final timetableGroupViewModel = Provider.of<TimetableGroupViewModel>(context);
    print("timetableGroupViewModel");

    print(timetableGroupViewModel);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title(title: 'Day'),
                    title(title: timetableGroupViewModel.timeTableGroup![0].timeForm),
          Column(
            children: timetableGroupViewModel.timeTableGroup!.map((tx) {
              return Text(tx.pitchId!.nameEn.toString() + " -- " ,style: TextStyle(color: Colors.red),);
            }).toList(),
          ) ,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      days(day: 'Friday', date: '7 Oct'),
                      days(day: 'Friday', date: '7 Oct'),
                    ],
                  ),
                  title(title: 'Time'),
                  Row(
                    children: [
                      timeOfGame(time: '120'),
                      timeOfGame(time: '60'),
                    ],
                  ),
                  title(title: 'Select Malap'),
                  places(),
                  places(),
                ],
              ),
              RoundedButton(
                text: 'Next',
                press: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context){
                  //   return CheckoutOutScreen(tripModel : widget.tripModel  , selectedDate : _selectedDate ,selectedTime :  selectedTime);
                  // }));
                  // Navigator.pushNamed(
                  //     context, CheckoutOutScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget days({String? day, String? date}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 100,
        height: 80,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(11)),
            border: Border.all(color: const Color(0xffdddddd), width: 1),
            color: const Color(0xffffffff)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // اليوم
            Text(day!,
                style: const TextStyle(
                    color: Color(0xff141414),
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0),
                textAlign: TextAlign.left),
            // 20 اكتوبر
            Text(date!,
                style: const TextStyle(
                    color: Color(0xff4d5055),
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0),
                textAlign: TextAlign.left)
          ],
        ),
      ),
    );
  }

  Widget places() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("A (7*7)",
              style: TextStyle(
                  color: Colors.lightGreen,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppins",
                  fontStyle: FontStyle.normal,
                  fontSize: 14.0),
              textAlign: TextAlign.left),
          const SizedBox(
            height: 2,
          ),
          Wrap(
            children: [
              timeOfGame(time: '2:00 PM'),
              timeOfGame(time: '3:30 PM'),
              timeOfGame(time: '4:00 PM'),
              timeOfGame(time: '5:00 PM'),
              timeOfGame(time: '8:00 PM'),
            ],
          ),
        ],
      ),
    );
  }

  Widget timeOfGame({String? time}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 100,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(11)),
            border: Border.all(color: const Color(0xffdddddd), width: 1),
            color: const Color(0xffffffff)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // اليوم
            Text(time!,
                style: const TextStyle(
                    color: Color(0xff141414),
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0),
                textAlign: TextAlign.left),
            // 20 اكتوبر
          ],
        ),
      ),
    );
  }

  Widget title({String? title}) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: Text(title!,
          style: const TextStyle(
              color: Color(0xff000000),
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
              fontStyle: FontStyle.normal,
              fontSize: 14.0),
          textAlign: TextAlign.left),
    );
  }

}
