import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utilitis/assets_manger.dart';


class RoundedButtonSignWith extends StatelessWidget {
  final String? text;
  final VoidCallback? press;
  final String? iconPath;
  final Color color, textColor , backgroundColor;

  const RoundedButtonSignWith({
    Key? key,
    this.text,
    this.press,
    this.iconPath,
    this.color = Colors.white,
    this.textColor = Colors.white,
    this.backgroundColor = const Color(0xff0081df),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top :  10),
      child: InkWell(
        onTap: press ,
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            width: double.infinity,
            //width: size.width * .01,
           // height: 50,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color:   backgroundColor ),
            child: Center(
              child: // sign in
              //  Sign in with Apple
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset( SvgAssets.path + iconPath!, height: 17 ,width: 17,) ,
                  const SizedBox(width: 20,) ,
                  Text(
                      text!,
                      style:   TextStyle(
                          color:   textColor,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Montserrat",
                          fontStyle:  FontStyle.normal,
                          fontSize: 12.0
                      ),
                      textAlign: TextAlign.center
                  ),
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}
