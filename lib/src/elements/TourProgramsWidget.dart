import 'package:flutter/material.dart';

class TourProgramsWidget extends StatelessWidget {
  final String title;

  final Color color;

  final String imagePath;

  const TourProgramsWidget(
      {super.key,
      required this.title,
      required this.color,
      required this.imagePath});

  // const TourProgramsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 106,
          height: 111,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(53)),
              color: Color(0xffe7e7e7)),
          child: Image.asset(imagePath),
        ),
        // Description
        const SizedBox(
          height: 8,
        ),
        Text(title,
            style: const TextStyle(
                color: const Color(0xff415460),
                fontWeight: FontWeight.w500,
                fontFamily: "Poppins",
                fontStyle: FontStyle.normal,
                fontSize: 16.0),
            textAlign: TextAlign.left)
      ],
    );
  }
}
