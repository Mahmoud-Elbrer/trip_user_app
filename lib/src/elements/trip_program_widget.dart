import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../config/routes/app_routes.dart';
import '../controllers/trip_program_provider.dart';
import '../models/trip_program_model.dart';
import '../utilitis/URL.dart';

class TripProgramWidget extends StatelessWidget {
  const TripProgramWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tripProgramModel = Provider.of<TripProgramModel>(context);
    print("Your Image ") ;
    print(Url.baseImageUrl+tripProgramModel.image.toString());
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
            image: NetworkImage('${Url.baseImageUrl}${tripProgramModel.image}'),
            fit: BoxFit.fill,
          ),
        ),
        height: 50,
        width: 170,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              Align( alignment: Alignment.topLeft, child:SvgPicture.asset('assets/icons/email.svg' ,width: 20  , height: 20,color: Colors.white70,),) ,
              Align( alignment: Alignment.bottomLeft, child: Text(tripProgramModel.name.toString())),
            ],
          ),
        ),
      ),
    );
  }
}
