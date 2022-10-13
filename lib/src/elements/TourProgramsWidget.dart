import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../models/trip_program_model.dart';
import '../pages/trips_screen.dart';

class TourProgramsWidget extends StatelessWidget {
  const TourProgramsWidget({Key? key}) : super(key: key);

  // const TourProgramsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tripProgramModel = Provider.of<TripProgramModel>(context);
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return const TripsScreen(emirateId: '63335d267384867af876cc52',);
        }));
      },
      child: SizedBox(
        child: Column(
          children: [
            Container(
              width: 106,
              height: 111,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(53)),
                  color: Color(0xffe7e7e7)),
              child: Center(child: SvgPicture.asset( 'assets/icons/calender.svg' , width: 45 , height: 45,)),
            ),
            // Description
            const SizedBox(
              height: 8,
            ),
            Text(tripProgramModel.name.toString(),
                style: const TextStyle(
                    color:  Color(0xff415460),
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0),
                textAlign: TextAlign.left)
          ],
        ),
      ),
    );
  }
}
