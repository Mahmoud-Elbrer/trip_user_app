import 'package:flutter/material.dart';

import '../elements/TourProgramsWidget.dart';

class TourProgramsScreen extends StatefulWidget {
  const TourProgramsScreen({Key? key}) : super(key: key);

  @override
  State<TourProgramsScreen> createState() => _TourProgramsScreenState();
}

class _TourProgramsScreenState extends State<TourProgramsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                TourProgramsWidget(
                    title: 'beach',
                    color: Color(0xffe7e7e7),
                    imagePath: 'assets/icons/calender.svg'),
                TourProgramsWidget(
                    title: 'beach',
                    color: Color(0xffe7e7e7),
                    imagePath: 'assets/icons/calender.svg'),
                TourProgramsWidget(
                    title: 'beach',
                    color: Color(0xffe7e7e7),
                    imagePath: 'assets/icons/calender.svg'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
