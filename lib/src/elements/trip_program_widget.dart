import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/trip_program_provider.dart';
import '../models/trip_program_model.dart';

class TripProgramWidget extends StatelessWidget {
  const TripProgramWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tripProgramModel = Provider.of<TripProgramModel>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
          image: DecorationImage(
            image: AssetImage(
                'assets/images/image.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        height: 50,
        width: 170,
        child: Stack(
          children: [
            Text(tripProgramModel.name.toString()),
          ],
        ),
      ),
    );
  }
}
